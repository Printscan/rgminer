#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "$SCRIPT_DIR" || {
  echo "ERROR: unable to access script dir: $SCRIPT_DIR" >&2
  exit 1
}
source "$SCRIPT_DIR/h-manifest.conf"

BIN_PATH="$SCRIPT_DIR/rgminer"
CONFIG_FILE="$CUSTOM_CONFIG_FILENAME"
LOG_DIR=$(dirname "$CUSTOM_LOG_BASENAME")
LOG_FILE="${CUSTOM_LOG_BASENAME}.log"
LAUNCH_CACHE_FILE="$SCRIPT_DIR/launch_cache.txt"

mkdir -p "$LOG_DIR"
: > "$LOG_FILE"

[[ -x "$BIN_PATH" ]] || chmod +x "$BIN_PATH"
[[ -f "$CONFIG_FILE" ]] || {
  echo "ERROR: config file not found: $CONFIG_FILE" >&2
  exit 1
}

: > "$LAUNCH_CACHE_FILE"

source "$CONFIG_FILE"

address="${ADDRESS:-}"
host="${HOST:-127.0.0.1}"
port="${PORT:-5555}"
coordinators_raw="${COORDINATORS:-}"
api_host="${API_HOST:-127.0.0.1}"
api_port="${API_PORT:-$CUSTOM_API_PORT}"
devices_raw="${DEVICES:-}"
grid_value="${GRID:-}"
block_value="${BLOCK:-}"
slice_value="${SLICE:-}"
extra_args_raw="${EXTRA_ARGS:-}"

trim_token() {
  local value="$1"
  value="${value#${value%%[!$'\t '\n]*}}"
  value="${value%${value##*[!$'\t '\n]}}"
  printf '%s' "$value"
}

strip_surrounding_quotes() {
  local value="$1"
  if [[ ${#value} -ge 2 ]]; then
    local first=${value:0:1}
    local last=${value: -1}
    if [[ $first == "$last" && ( $first == '"' || $first == "'" ) ]]; then
      value=${value:1:${#value}-2}
      value=$(trim_token "$value")
    fi
  fi
  printf '%s' "$value"
}

normalize_algo_value() {
  local value="$1"
  value=$(strip_surrounding_quotes "$value")
  value=$(trim_token "$value")
  [[ -z "$value" ]] && return 0
  local normalized=${value,,}
  if [[ $normalized == memehash ]]; then
    normalized="memhash"
  fi
  printf '%s' "$normalized"
}

resolve_worker_name() {
  local value="${WORKER_NAME:-}"
  if [[ -z "$value" ]]; then
    local -a fallbacks=(
      "${RIG:-}"
      "${RIG_NAME:-}"
      "${CUSTOM_WORKER:-}"
      "${CUSTOM_WORKER_NAME:-}"
      "${MINER_WORKER:-}"
    )
    for candidate in "${fallbacks[@]}"; do
      if [[ -n "$candidate" ]]; then
        value="$candidate"
        break
      fi
    done
  fi
  if [[ -z "$value" && -f /hive-config/rig.conf ]]; then
    local parsed
    parsed=$(grep -E '^WORKER_NAME=' /hive-config/rig.conf 2>/dev/null | head -n1 | sed -E 's/^WORKER_NAME=\"?([^\"]*)\"?.*/\1/')
    parsed=$(trim_token "$parsed")
    value="$parsed"
  fi
  if [[ -z "$value" ]]; then
    value=$(hostname 2>/dev/null || true)
  fi
  value=$(trim_token "$value")
  printf '%s' "$value"
}

algo_value=$(normalize_algo_value "${ALGO:-${CUSTOM_ALGO:-}}")

if [[ -z "$address" ]]; then
  echo "ERROR: ADDRESS is not set in $CONFIG_FILE" >&2
  exit 1
fi

declare -a coordinator_args=()
if [[ -n "$coordinators_raw" ]]; then
  while IFS= read -r entry; do
    entry=$(trim_token "$entry")
    [[ -z "$entry" ]] && continue
    for token in $entry; do
      token=$(trim_token "$token")
      [[ -z "$token" ]] && continue
      coordinator_args+=("$token")
    done
  done <<< "$coordinators_raw"
fi

if ((${#coordinator_args[@]} == 0)); then
  default_host=$(trim_token "$host")
  default_port=$(trim_token "$port")
  if [[ $default_host == *[[:space:]]* ]]; then
    read -r default_host _ <<< "$default_host"
    default_host=$(trim_token "$default_host")
  fi
  if [[ $default_port == *[[:space:]]* ]]; then
    read -r default_port _ <<< "$default_port"
    default_port=$(trim_token "$default_port")
  fi
  if [[ -z "$default_host" ]]; then
    coordinator_args+=("127.0.0.1:5555")
  else
    if [[ -z "$default_port" || ! $default_port =~ ^[0-9]+$ ]]; then
      default_port="5555"
    fi
    if [[ $default_host == \[*\]*:* ]]; then
      coordinator_args+=("$default_host")
    elif [[ $default_host =~ ^[^:]+:[0-9]+$ ]]; then
      coordinator_args+=("$default_host")
    elif [[ $default_host == \[*\] ]]; then
      coordinator_args+=("${default_host}:${default_port}")
    elif [[ $default_host == *:* ]]; then
      coordinator_args+=("[$default_host]:$default_port")
    else
      coordinator_args+=("${default_host}:${default_port}")
    fi
  fi
fi

cmd=("$BIN_PATH" --address "$address")

clean_devices=${devices_raw//[[:space:]]/}
if [[ -n "$clean_devices" ]]; then
  cmd+=("--devices" "$clean_devices")
fi

if [[ -n "$grid_value" ]]; then
  cmd+=("--grid" "$grid_value")
fi
if [[ -n "$block_value" ]]; then
  cmd+=("--block" "$block_value")
fi
if [[ -n "$slice_value" ]]; then
  cmd+=("--slice" "$slice_value")
fi

if [[ -n "$api_host" ]]; then
  cmd+=("--api-host" "$api_host")
fi
if [[ -n "$api_port" ]]; then
  cmd+=("--api-port" "$api_port")
fi

log_info() {
  echo "[rgminer] INFO: $*" | tee -a "$LOG_FILE"
}

log_warn() {
  echo "[rgminer] WARNING: $*" | tee -a "$LOG_FILE"
}

format_cmd_for_script() {
  local -a argv=("$@")
  local rendered=""
  local token
  for token in "${argv[@]}"; do
    printf -v rendered '%s%q ' "$rendered" "$token"
  done
  printf '%s' "${rendered% }"
}

resolve_term_value() {
  local value="${TERM:-}"
  if [[ -z "$value" || "$value" == "dumb" ]]; then
    value="xterm-256color"
  fi
  printf '%s' "$value"
}

resolve_tty_size() {
  local cols="${RGMINER_TTY_COLUMNS:-}"
  local rows="${RGMINER_TTY_LINES:-}"
  if [[ -z "$cols" || -z "$rows" ]]; then
    local stty_size
    stty_size=$(stty size 2>/dev/null || true)
    if [[ $stty_size =~ ^([0-9]+)[[:space:]]+([0-9]+)$ ]]; then
      rows=${rows:-${BASH_REMATCH[1]}}
      cols=${cols:-${BASH_REMATCH[2]}}
    fi
  fi
  if [[ -z "$cols" || ! $cols =~ ^[0-9]+$ ]]; then
    cols=80
  fi
  if [[ -z "$rows" || ! $rows =~ ^[0-9]+$ ]]; then
    rows=24
  fi
  printf '%s %s\n' "$cols" "$rows"
}

append_pool_endpoints() {
  local algo="$1"
  local normalized
  normalized=$(normalize_algo_value "$algo")
  local flag="--coordinator"
  if [[ $normalized == memhash ]]; then
    flag="--stratum"
  fi
  for endpoint in "${coordinator_args[@]}"; do
    endpoint=$(trim_token "$endpoint")
    [[ -z "$endpoint" ]] && continue
    if [[ $endpoint != *:* ]]; then
      endpoint="${endpoint}:5555"
    fi
    cmd+=("$flag" "$endpoint")
  done
}

append_algo_arg() {
  local value="$1"
  local normalized
  normalized=$(normalize_algo_value "$value")
  [[ -z "$normalized" ]] && return 0
  case "$normalized" in
    memhash|blake2b)
      cmd+=("--algo" "$normalized")
      ;;
    *)
      log_warn "Unsupported algo '$value'; supported: memhash, blake2b"
      ;;
  esac
}

declare -a extra_program_pids=()
declare -a extra_program_inline_paths=()
declare -A extra_program_inline_backup=()
miner_pid=""
miner_tail_pid=""

cleanup() {
  if [[ -n "$miner_tail_pid" ]]; then
    if kill -0 "$miner_tail_pid" >/dev/null 2>&1; then
      kill "$miner_tail_pid" >/dev/null 2>&1 || true
      wait "$miner_tail_pid" 2>/dev/null || true
    fi
    miner_tail_pid=""
  fi

  if [[ -n "$miner_pid" ]]; then
    if kill -0 "$miner_pid" >/dev/null 2>&1; then
      kill "$miner_pid" >/dev/null 2>&1 || true
      wait "$miner_pid" 2>/dev/null || true
    fi
    miner_pid=""
  fi

  if ((${#extra_program_pids[@]})); then
    for pid in "${extra_program_pids[@]}"; do
      [[ -z "$pid" ]] && continue
      if kill -0 "$pid" >/dev/null 2>&1; then
        kill "$pid" >/dev/null 2>&1 || true
        wait "$pid" 2>/dev/null || true
      fi
    done
  fi

  if ((${#extra_program_inline_paths[@]})); then
    for cfg_path in "${extra_program_inline_paths[@]}"; do
      [[ -z "$cfg_path" ]] && continue
      backup_path="${extra_program_inline_backup[$cfg_path]-}"
      if [[ -n "$backup_path" && -f "$backup_path" ]]; then
        mv -f "$backup_path" "$cfg_path" 2>/dev/null || true
      else
        rm -f "$cfg_path" 2>/dev/null || true
      fi
    done
  fi
}

trap cleanup EXIT

start_additional_program() {
  local entry="$1"
  local program_path="$entry"
  local program_config=""
  local separator=""

  if [[ "$program_path" == *'::'* ]]; then
    separator="::"
  elif [[ "$program_path" == *':'* ]]; then
    local candidate=${program_path#*:}
    candidate=$(trim_token "$candidate")
    local first_char=${candidate:0:1}
    if [[ $first_char == '{' || $first_char == '[' || $first_char == '"' || $first_char == "'" ]]; then
      separator=":"
    fi
  fi

  if [[ -n "$separator" ]]; then
    program_config=${program_path#*${separator}}
    program_path=${program_path%%${separator}*}
    program_path=$(trim_token "$program_path")
    program_config=$(trim_token "$program_config")
    if [[ ${#program_config} -ge 2 ]]; then
      local first=${program_config:0:1}
      local last=${program_config: -1}
      if [[ $first == "$last" && ( $first == '"' || $first == "'" ) ]]; then
        program_config=${program_config:1:${#program_config}-2}
        program_config=$(trim_token "$program_config")
      fi
    fi
  else
    program_path=$(trim_token "$program_path")
  fi

  if [[ -z "$program_path" ]]; then
    log_warn "Additional program entry is empty"
    return
  fi

  if [[ ! -e "$program_path" ]]; then
    log_warn "Additional program not found: $program_path"
    return
  fi

  if [[ -d "$program_path" ]]; then
    log_warn "Additional program path is a directory: $program_path"
    return
  fi

  if [[ ! -x "$program_path" ]]; then
    if ! chmod +x "$program_path" 2>/dev/null; then
      log_warn "Unable to make additional program executable: $program_path"
      return
    fi
  fi

  local config_path=""
  local inline_file=""
  local backup_file=""
  local program_dir
  program_dir=$(dirname "$program_path")

  if [[ -n "$program_config" ]]; then
    if [[ -f "$program_config" ]]; then
      config_path="$program_config"
    elif [[ ${program_config:0:1} == '{' || ${program_config:0:1} == '[' ]]; then
      inline_file="$program_dir/config.conf"
      if [[ -f "$inline_file" ]]; then
        backup_file=$(mktemp)
        if ! cp "$inline_file" "$backup_file" 2>/dev/null; then
          log_warn "Failed to backup existing config for $program_path"
          backup_file=""
        fi
      fi
      if ! printf '%s\n' "$program_config" > "$inline_file"; then
        log_warn "Failed to write inline config for $program_path"
        if [[ -n "$backup_file" && -f "$backup_file" ]]; then
          mv -f "$backup_file" "$inline_file" 2>/dev/null || true
        fi
        return
      fi
      chmod 600 "$inline_file" 2>/dev/null || true
      config_path="$inline_file"
      if [[ -z ${extra_program_inline_backup["$inline_file"]+set} ]]; then
        extra_program_inline_paths+=("$inline_file")
      fi
      extra_program_inline_backup["$inline_file"]="$backup_file"
    else
      log_warn "Config file not found for additional program: $program_config"
      return
    fi
  fi

  local desc="$program_path"
  if [[ -n "$config_path" ]]; then
    desc+=" (config: $config_path)"
  fi
  log_info "Starting additional program: $desc"

  if [[ -n "$config_path" ]]; then
    RUN_CONFIG_FILE="$config_path" "$program_path" >>"$LOG_FILE" 2>&1 &
  else
    "$program_path" >>"$LOG_FILE" 2>&1 &
  fi
  extra_program_pids+=($!)
}

if [[ -n "$extra_args_raw" ]]; then
  declare -a parsed_extra_args=()
  declare -a filtered_extra_args=()
  declare -i skip_value=0
  while IFS= read -r tok; do
    tok=$(trim_token "$tok")
    [[ -z "$tok" ]] && continue
    parsed_extra_args+=("$tok")
  done < <(printf '%s\n' "$extra_args_raw")

  worker_name_value=""
  for ((i = 0; i < ${#parsed_extra_args[@]}; i++)); do
    tok=${parsed_extra_args[$i]}
    if (( skip_value )); then
      skip_value=0
      continue
    fi
    if [[ $tok == --worker-name ]]; then
      next_index=$((i + 1))
      if (( next_index < ${#parsed_extra_args[@]} )); then
        worker_name_value=${parsed_extra_args[$next_index]}
        skip_value=1
      else
        log_warn "Found --worker-name without a value in EXTRA_ARGS"
      fi
      continue
    fi
    if [[ $tok == --worker-name=* ]]; then
      worker_name_value=${tok#--worker-name=}
      continue
    fi
    if [[ $tok == --algo ]]; then
      next_index=$((i + 1))
      if (( next_index < ${#parsed_extra_args[@]} )); then
        algo_candidate=${parsed_extra_args[$next_index]}
        if [[ -n "$algo_candidate" ]]; then
          algo_value=$(normalize_algo_value "$algo_candidate")
        else
          log_warn "Found --algo without a value in EXTRA_ARGS"
        fi
        skip_value=1
      else
        log_warn "Found --algo without a value in EXTRA_ARGS"
      fi
      continue
    fi
    if [[ $tok == --algo=* ]]; then
      algo_candidate=${tok#--algo=}
      if [[ -n "$algo_candidate" ]]; then
        algo_value=$(normalize_algo_value "$algo_candidate")
      else
        log_warn "Found --algo= without a value in EXTRA_ARGS"
      fi
      continue
    fi
    filtered_extra_args+=("$tok")
  done

  if [[ -n "$worker_name_value" ]]; then
    worker_name_value=$(strip_surrounding_quotes "$worker_name_value")
  fi
  if [[ -z "$worker_name_value" ]]; then
    worker_name_value=$(resolve_worker_name)
  fi
  if [[ -n "$worker_name_value" ]]; then
    cmd+=("--worker-name" "$worker_name_value")
  else
    log_warn "Unable to determine worker name; --worker-name flag omitted"
  fi

  append_pool_endpoints "$algo_value"
  append_algo_arg "$algo_value"

  if ((${#filtered_extra_args[@]})); then
    cmd+=("${filtered_extra_args[@]}")
  fi
else
  default_worker_name=$(resolve_worker_name)
  if [[ -n "$default_worker_name" ]]; then
    cmd+=("--worker-name" "$default_worker_name")
  else
    log_warn "Unable to determine worker name; --worker-name flag omitted"
  fi
  append_pool_endpoints "$algo_value"
  append_algo_arg "$algo_value"
fi

extra_programs_raw="${EXTRA_PROGRAMS:-}"
extra_program_entries=()
if [[ -n "$extra_programs_raw" ]]; then
  while IFS= read -r entry; do
    entry=$(trim_token "$entry")
    [[ -z "$entry" ]] && continue
    extra_program_entries+=("$entry")
  done < <(printf '%s\n' "$extra_programs_raw")
fi

if ((${#extra_program_entries[@]})); then
  for entry in "${extra_program_entries[@]}"; do
    start_additional_program "$entry"
  done
fi

run_miner() {
  local term_value
  local tty_cols
  local tty_rows
  term_value=$(resolve_term_value)
  read -r tty_cols tty_rows < <(resolve_tty_size)
  if command -v script >/dev/null 2>&1; then
    local cmd_string
    local term_escaped
    cmd_string=$(format_cmd_for_script "${cmd[@]}")
    printf -v term_escaped '%q' "$term_value"
    script -q -f -c "TERM=$term_escaped COLUMNS=$tty_cols LINES=$tty_rows stty cols $tty_cols rows $tty_rows 2>/dev/null; exec $cmd_string" /dev/null
  else
    TERM="$term_value" COLUMNS="$tty_cols" LINES="$tty_rows" "${cmd[@]}"
  fi
}

echo "[rgminer] Launch command: ${cmd[*]}" | tee -a "$LOG_FILE"
if command -v tail >/dev/null 2>&1; then
  run_miner >>"$LOG_FILE" 2>&1 &
  miner_pid=$!

  tail -n 0 -F "$LOG_FILE" &
  miner_tail_pid=$!

  wait "$miner_pid"
  miner_status=$?
  miner_pid=""

  if [[ -n "$miner_tail_pid" ]]; then
    if kill -0 "$miner_tail_pid" >/dev/null 2>&1; then
      kill "$miner_tail_pid" >/dev/null 2>&1 || true
    fi
    wait "$miner_tail_pid" 2>/dev/null || true
    miner_tail_pid=""
  fi

  exit "$miner_status"
else
  run_miner 2>&1 | tee -a "$LOG_FILE"
  exit "${PIPESTATUS[0]}"
fi
