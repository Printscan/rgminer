#!/usr/bin/env bash
set -euo pipefail

export LC_ALL=C

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$SCRIPT_DIR/h-manifest.conf"

LOG_FILE="${CUSTOM_LOG_BASENAME}.log"
VERSION_VALUE="${CUSTOM_VERSION:-}"
ALGO_VALUE="${CUSTOM_ALGO:-}"  # оставляем для совместимости, если зададут
BIN_PATH="$SCRIPT_DIR/rgminer"
IGNORE_PCI_BUS_00=${IGNORE_PCI_BUS_00:-1}

API_HOST_VALUE="127.0.0.1"
API_PORT_VALUE="${CUSTOM_API_PORT:-9100}"

if [[ -f "${CUSTOM_CONFIG_FILENAME:-}" ]]; then
  # shellcheck disable=SC1090
  source "${CUSTOM_CONFIG_FILENAME}"
  API_HOST_VALUE="${API_HOST:-$API_HOST_VALUE}"
  API_PORT_VALUE="${API_PORT:-$API_PORT_VALUE}"
  if [[ -n ${ALGO:-} ]]; then
    ALGO_VALUE="$ALGO"
  elif [[ -n ${CUSTOM_ALGO:-} ]]; then
    ALGO_VALUE="$CUSTOM_ALGO"
  fi
fi

json_escape() {
  local str=${1-}
  str=${str//\\/\\\\}
  str=${str//"/\\"}
  str=${str//$'\n'/\\n}
  str=${str//$'\r'/\\r}
  str=${str//$'\t'/\\t}
  echo "$str"
}

array_to_json_numbers() {
  local -n arr_ref=$1
  local default=${2:-0}
  local output="["
  local val
  for val in "${arr_ref[@]}"; do
    [[ -z $val ]] && val=$default
    output+="${val},"
  done
  if [[ $output == "[" ]]; then
    printf '[]'
  else
    printf '%s' "${output%,}]"
  fi
}

should_skip_bus_id() {
  local id=${1,,}
  if [[ $id =~ ^([0-9a-f]{4}|[0-9a-f]{8}):([0-9a-f]{2}):([0-9a-f]{2})\.([0-7])$ ]]; then
    local bus=${BASH_REMATCH[2]}
    local func=${BASH_REMATCH[4]}
    if [[ $bus == "00" && $func == "0" ]]; then
      return 0
    fi
  elif [[ $id =~ ^([0-9a-f]{2}):([0-9a-f]{1,2})\.([0-7])$ ]]; then
    local bus=${BASH_REMATCH[1]}
    local func=${BASH_REMATCH[3]}
    if [[ $bus == "00" && $func == "0" ]]; then
      return 0
    fi
  fi
  return 1
}

get_proc_uptime() {
  if [[ ! -x $BIN_PATH ]]; then
    return 1
  fi
  if ! command -v pgrep >/dev/null 2>&1; then
    return 1
  fi
  mapfile -t pids < <(pgrep -f "$BIN_PATH" 2>/dev/null || true)
  for pid in "${pids[@]}"; do
    [[ -z $pid ]] && continue
    etimes=$(ps -p "$pid" -o etimes= 2>/dev/null | awk 'NR==1 { gsub(/^[ \t]+/, ""); print }')
    if [[ $etimes =~ ^[0-9]+$ ]]; then
      echo "$etimes"
      return 0
    fi
  done
  return 1
}

# GPU sensors (оставляем лолеровый подход)
declare -a temp_arr fan_arr bus_arr busids_hex
temp_arr=()
fan_arr=()
bus_arr=()
busids_hex=()
declare -A skip_idx

if command -v nvidia-smi >/dev/null 2>&1; then
  while IFS=, read -r idx temp fan busid; do
    idx=${idx//[[:space:]]/}
    [[ -z $idx ]] && continue
    temp=${temp//[[:space:]]/}
    if [[ ! $temp =~ ^-?[0-9]+ ]] ; then temp=0; fi
    temp=${temp%%.*}
    fan=${fan//[[:space:]]/}
    if [[ ! $fan =~ ^-?[0-9]+ ]] ; then fan=0; fi
    fan=${fan%%.*}
    busid=${busid//[[:space:]]/}
    [[ -z $busid ]] && busid="0000:00:00.0"
    temp_arr[idx]=$temp
    fan_arr[idx]=$fan
    busids_hex[idx]=${busid,,}
  done < <(nvidia-smi --query-gpu=index,temperature.gpu,fan.speed,pci.bus_id --format=csv,noheader,nounits 2>/dev/null || true)
fi

all_bus_zero=true
for idx in "${!busids_hex[@]}"; do
  id=${busids_hex[$idx]}
  if (( IGNORE_PCI_BUS_00 != 0 )) && should_skip_bus_id "$id"; then
    skip_idx[$idx]=1
  fi
  bus_part=${id%%:*}
  if [[ $id =~ ^([0-9a-f]{4}|[0-9a-f]{8}):([0-9a-f]{2}):([0-9a-f]{2})\.[0-7]$ ]]; then
    bus_part=${BASH_REMATCH[2]}
  elif [[ $id =~ ^([0-9a-f]{2}):([0-9a-f]{1,2})\.[0-7]$ ]]; then
    bus_part=${BASH_REMATCH[1]}
  fi
  if [[ $bus_part =~ ^[0-9a-f]+$ ]]; then
    bus_arr[$idx]=$((16#$bus_part))
    if (( bus_arr[$idx] != 0 )); then
      all_bus_zero=false
    fi
  else
    bus_arr[$idx]=0
  fi
done

if $all_bus_zero; then
  skip_idx=()
fi

# Получаем статистику от майнера
api_json=""
if command -v curl >/dev/null 2>&1; then
  api_json=$(curl -s --max-time 2 "http://$API_HOST_VALUE:$API_PORT_VALUE/metrics" 2>/dev/null || true)
fi

declare -a hs_arr
hs_arr=()
declare -A hs_map
declare -a hs_indices
hs_map=()
hs_indices=()
accepted_total=0

if [[ -n $api_json ]]; then
  while IFS=$'\t' read -r dev_id rate; do
    [[ -z $dev_id || -z $rate ]] && continue
    if [[ $dev_id =~ ^[0-9]+$ && $rate =~ ^-?[0-9]+(\.[0-9]+)?([eE][+-]?[0-9]+)?$ ]]; then
      hs_map["$dev_id"]="$rate"
    fi
  done < <(echo "$api_json" | jq -r '.miners[] | "\(.deviceId)\t\(.lastRate)"' 2>/dev/null || true)

  if ((${#hs_map[@]})); then
    while IFS= read -r id; do
      hs_indices+=("$id")
    done < <(printf '%s\n' "${!hs_map[@]}" | sort -n)
    for id in "${hs_indices[@]}"; do
      hs_arr+=("${hs_map[$id]}")
    done
  fi

  accepted_total=$(echo "$api_json" | jq -r '[.miners[]?.acceptedShares // 0] | add' 2>/dev/null || echo 0)
fi

if ((${#hs_arr[@]} == 0)); then
  hs_arr=(0)
fi

declare -a hs_arr_khs
declare -a hs_arr_gh
hs_arr_khs=()
hs_arr_gh=()

for idx in "${!hs_arr[@]}"; do
  rate="${hs_arr[$idx]}"
  if [[ -z $rate ]]; then
    rate=0
  fi
  kh_value=$(awk -v r="$rate" 'BEGIN { printf "%.6f", r / 1000 }')
  gh_value=$(awk -v r="$rate" 'BEGIN { printf "%.6f", r / 1000000000 }')
  hs_arr_khs[$idx]="$kh_value"
  hs_arr_gh[$idx]="$gh_value"
done

# Температуры/кулеры для выбранных карт
have_temp=false
have_fan=false
have_bus=false

temp_out=()
fan_out=()
bus_out=()

for idx in "${!temp_arr[@]}"; do
  if ((${#hs_indices[@]})) && [[ -z ${hs_map[$idx]+set} ]]; then
    continue
  fi
  if [[ -n ${skip_idx[$idx]:-} ]]; then
    continue
  fi
  if [[ -n ${temp_arr[$idx]:-} ]]; then
    temp_out+=("${temp_arr[$idx]}")
    have_temp=true
  fi
  if [[ -n ${fan_arr[$idx]:-} ]]; then
    fan_out+=("${fan_arr[$idx]}")
    have_fan=true
  fi
  if [[ -n ${bus_arr[$idx]:-} ]]; then
    bus_out+=("${bus_arr[$idx]}")
    have_bus=true
  fi
done

if ! $have_temp; then temp_out=(); fi
if ! $have_fan; then fan_out=(); fi
if ! $have_bus; then bus_out=(); fi

if ((${#hs_arr_khs[@]} > 0)); then
  sum_rate_khs=$(printf '%s\n' "${hs_arr_khs[@]}" | awk 'BEGIN { s = 0 } NF { s += $1 } END { if (NR == 0) printf "0"; else printf "%.6f", s }')
else
  sum_rate_khs=0
fi
sum_rate_gh=$(awk -v s="$sum_rate_khs" 'BEGIN { printf "%.6f", s / 1000000 }')

if uptime=$(get_proc_uptime); then
  :
elif [[ -f $LOG_FILE ]]; then
  now=$(date +%s)
  file_mtime=$(stat -c %Y "$LOG_FILE" 2>/dev/null || echo 0)
  (( uptime = now - file_mtime ))
  (( uptime < 0 )) && uptime=0
else
  uptime=0
fi
hs_json=$(array_to_json_numbers hs_arr_khs 0)
hs_gh_json=$(array_to_json_numbers hs_arr_gh 0)
temp_json=$(array_to_json_numbers temp_out 0)
fan_json=$(array_to_json_numbers fan_out 0)
bus_json=$(array_to_json_numbers bus_out 0)

if command -v jq >/dev/null 2>&1; then
  stats=$(jq -nc \
    --argjson hs "$hs_json" \
    --argjson hs_gh "$hs_gh_json" \
    --argjson temp "$temp_json" \
    --argjson fan "$fan_json" \
    --argjson uptime "$uptime" \
    --arg ver "$VERSION_VALUE" \
    --arg algo "$ALGO_VALUE" \
    --argjson bus "$bus_json" \
    --arg total "$sum_rate_khs" \
    --arg total_gh "$sum_rate_gh" \
    --arg accepted "$accepted_total" \
    '{
      hs: $hs,
      hs_units: "kH/s",
      hs_gh: $hs_gh,
      temp: $temp,
      fan: $fan,
      uptime: $uptime,
      ver: $ver,
      ar: [($accepted | tonumber), 0],
      bus_numbers: $bus,
      total_khs: ($total | tonumber),
      total_gh: ($total_gh | tonumber)
    } | if $algo == "" then . else . + {algo: $algo} end'
  )
else
  ver_json=$(json_escape "$VERSION_VALUE")
  stats="{\"hs\":$hs_json,\"hs_units\":\"kH/s\",\"hs_gh\":$hs_gh_json,\"temp\":$temp_json,\"fan\":$fan_json,\"uptime\":$uptime,\"ver\":\"$ver_json\",\"ar\":[${accepted_total},0],\"bus_numbers\":$bus_json,\"total_khs\":$sum_rate_khs,\"total_gh\":$sum_rate_gh"
  if [[ -n $ALGO_VALUE ]]; then
    algo_json=$(json_escape "$ALGO_VALUE")
    stats+=",\"algo\":\"$algo_json\"}"
  else
    stats+='}'
  fi
fi

[[ -z $sum_rate_khs ]] && sum_rate_khs=0
[[ -z $stats ]] && stats="{\"hs\":[],\"hs_units\":\"kH/s\",\"hs_gh\":[],\"temp\":[],\"fan\":[],\"uptime\":0,\"ver\":\"\",\"ar\":[${accepted_total},0],\"total_khs\":0,\"total_gh\":0}"

echo "$sum_rate_khs"
echo "$stats"
