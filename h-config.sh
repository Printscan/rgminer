#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$SCRIPT_DIR/h-manifest.conf"

error() {
  echo "ERROR: $*" >&2
  exit 1
}

warn() {
  echo "WARNING: $*" >&2
}

trim_whitespace() {
  local text="${1-}"
  text="${text#${text%%[!$'\t\r\n ']*}}"
  text="${text%${text##*[!$'\t\r\n ']}}"
  echo "$text"
}

strip_quotes() {
  local value="${1-}"
  if [[ ${#value} -ge 2 ]]; then
    local first=${value:0:1}
    local last=${value: -1}
    if [[ $first == "$last" && ( $first == '"' || $first == "'" ) ]]; then
      value=${value:1:${#value}-2}
    fi
  fi
  echo "$value"
}

tokenize_user_config() {
  local input="${1-}"
  local length=${#input}
  local token=""
  local in_single=0
  local in_double=0
  local escape=0
  local brace_depth=0
  local bracket_depth=0
  local char
  local -a tokens=()

  for ((idx=0; idx<length; idx++)); do
    char=${input:idx:1}
    if ((escape)); then
      token+="$char"
      escape=0
      continue
    fi
    case "$char" in
      '\\')
        token+="$char"
        escape=1
        ;;
      "'")
        token+="$char"
        if (( !in_double )); then
          in_single=$((1 - in_single))
        fi
        ;;
      '"')
        token+="$char"
        if (( !in_single )); then
          in_double=$((1 - in_double))
        fi
        ;;
      '{')
        token+="$char"
        if (( !in_single && !in_double )); then
          brace_depth=$((brace_depth + 1))
        fi
        ;;
      '}')
        token+="$char"
        if (( !in_single && !in_double && brace_depth > 0 )); then
          brace_depth=$((brace_depth - 1))
        fi
        ;;
      '[')
        token+="$char"
        if (( !in_single && !in_double )); then
          bracket_depth=$((bracket_depth + 1))
        fi
        ;;
      ']')
        token+="$char"
        if (( !in_single && !in_double && bracket_depth > 0 )); then
          bracket_depth=$((bracket_depth - 1))
        fi
        ;;
      $' ' | $'\t' | $'\n')
        if (( brace_depth == 0 && bracket_depth == 0 && !in_single && !in_double )); then
          if [[ -n "$token" ]]; then
            tokens+=("$token")
            token=""
          fi
        else
          token+="$char"
        fi
        ;;
      *)
        token+="$char"
        ;;
    esac
  done

  if [[ -n "$token" ]]; then
    tokens+=("$token")
  fi

  if ((${#tokens[@]})); then
    printf '%s\0' "${tokens[@]}"
  fi
}

declare -a COORDINATOR_TOKENS=()
declare -A COORDINATOR_SEEN=()

normalize_coordinator_host() {
  local host="${1-}"
  host=$(strip_quotes "$(trim_whitespace "$host")")
  [[ -z "$host" ]] && return 0
  host=${host#[}
  host=${host%]}
  printf '%s' "$host"
}

add_coordinator_entry() {
  local raw_host="${1-}"
  local raw_port="${2-}"

  raw_host=$(normalize_coordinator_host "$raw_host")
  [[ -z "$raw_host" ]] && return 0

  raw_port=$(strip_quotes "$(trim_whitespace "${raw_port-}")")
  local port_value="$raw_port"
  if [[ -z "$port_value" || ! $port_value =~ ^[0-9]+$ ]]; then
    port_value="$PORT"
  fi
  if [[ -z "$port_value" || ! $port_value =~ ^[0-9]+$ ]]; then
    port_value="5555"
  fi

  local host_key=${raw_host,,}
  local dedupe_key="${host_key}|${port_value}"
  if [[ -n ${COORDINATOR_SEEN[$dedupe_key]+x} ]]; then
    return 0
  fi
  COORDINATOR_SEEN[$dedupe_key]=1

  local formatted_host="$raw_host"
  if [[ $formatted_host == *:* && $formatted_host != \[*\] ]]; then
    formatted_host="[$formatted_host]"
  fi

  COORDINATOR_TOKENS+=("${formatted_host}:${port_value}")
}

add_coordinator_tokens_from_value() {
  local raw="${1-}"
  raw=$(strip_quotes "$(trim_whitespace "$raw")")
  [[ -z "$raw" ]] && return 0

  local sanitized="$raw"
  sanitized=${sanitized//,/ }
  sanitized=${sanitized//;/ }
  sanitized=${sanitized//$'\n'/ }
  sanitized=${sanitized//$'\r'/ }
  sanitized=${sanitized//$'\t'/ }

  local -a tokens=()
  read -r -a tokens <<< "$sanitized"

  if ((${#tokens[@]} == 0)); then
    parse_host_port_from_endpoint "$raw"
    return 0
  fi

  local token
  for token in "${tokens[@]}"; do
    token=$(strip_quotes "$(trim_whitespace "$token")")
    [[ -z "$token" ]] && continue
    parse_host_port_from_endpoint "$token"
  done
}

ensure_coordinator_tokens() {
  if ((${#COORDINATOR_TOKENS[@]} == 0)); then
    local host_value
    host_value=$(trim_whitespace "$HOST")
    if [[ -n "$host_value" ]]; then
      add_coordinator_tokens_from_value "$host_value"
      if ((${#COORDINATOR_TOKENS[@]} == 0)); then
        add_coordinator_entry "$host_value" "$PORT"
      fi
    fi
  fi

  if ((${#COORDINATOR_TOKENS[@]} == 0)); then
    add_coordinator_entry "127.0.0.1" "$PORT"
  fi
}

set_config_value() {
  local key="${1-}"
  local value="${2-}"
  local normalized=${key,,}
  normalized=${normalized//-/_}
  normalized=${normalized//./_}
  while [[ $normalized == _* ]]; do
    normalized=${normalized#_}
  done

  case "$normalized" in
    address|wallet)
      ADDRESS="$value"
      return 0
      ;;
    coordinator|coordinators|primary_coordinator)
      add_coordinator_tokens_from_value "$value"
      return 0
      ;;
    host|server|pool|url)
      HOST="$value"
      return 0
      ;;
    port|coordinator_port|server_port|pool_port)
      PORT="$value"
      return 0
      ;;
    api_host|api_host_value|apiaddress|api_endpoint|apihost)
      API_HOST="$value"
      return 0
      ;;
    api_port|apiport)
      API_PORT="$value"
      return 0
      ;;
    devices|gpus|gpu|device_list)
      DEVICES="$value"
      return 0
      ;;
    grid|grid_size)
      GRID="$value"
      return 0
      ;;
    block|block_size)
      BLOCK="$value"
      return 0
      ;;
    slice|nonce_slice|nonce)
      SLICE="$value"
      return 0
      ;;
    algo|algorithm|custom_algo)
      ALGO="$value"
      return 0
      ;;
    extra_args|extra)
      EXTRA_ARGS_TOKENS+=("$value")
      return 0
      ;;
    run)
      [[ -n "$value" ]] && EXTRA_PROGRAMS_LIST+=("$value")
      return 0
      ;;
  esac
  return 1
}

parse_host_port_from_endpoint() {
  local endpoint="${1-}"
  endpoint=$(trim_whitespace "$endpoint")
  [[ -z "$endpoint" ]] && return 0

  local sanitized="$endpoint"
  sanitized="${sanitized#*@}"         # drop credentials if present
  sanitized="${sanitized#*://}"
  sanitized="${sanitized%%/*}"

  local host_part=""
  local port_part=""

  if [[ $sanitized == \[*\]*:* ]]; then
    host_part="${sanitized%%]*}"
    host_part="${host_part#[}"
    port_part="${sanitized##*:}"
  elif [[ $sanitized == *:* ]]; then
    host_part="${sanitized%%:*}"
    port_part="${sanitized##*:}"
  else
    host_part="$sanitized"
  fi

  host_part=$(trim_whitespace "$host_part")
  port_part=$(trim_whitespace "$port_part")

  if [[ -n "$host_part" ]]; then
    HOST="$host_part"
  fi
  if [[ -n "$port_part" && $port_part =~ ^[0-9]+$ ]]; then
    PORT="$port_part"
  fi

  if [[ -n "$host_part" ]]; then
    local port_value="$port_part"
    if [[ -z "$port_value" || ! $port_value =~ ^[0-9]+$ ]]; then
      port_value="$PORT"
    fi
    add_coordinator_entry "$host_part" "$port_value"
  fi
}

CONFIG_FILE="${CUSTOM_CONFIG_FILENAME:-}"
[[ -z "$CONFIG_FILE" ]] && error "CUSTOM_CONFIG_FILENAME is not set"

[[ -z "${CUSTOM_TEMPLATE:-}" ]] && error "CUSTOM_TEMPLATE (wallet address) is empty"

ADDRESS=$(trim_whitespace "$(strip_quotes "$(trim_whitespace "${CUSTOM_TEMPLATE:-}")")")
ADDRESS=${ADDRESS//%WORKER_NAME%/${WORKER_NAME:-}}
ADDRESS=${ADDRESS//%WORKER_ID%/${WORKER_ID:-}}
ADDRESS=${ADDRESS//%FARM_ID%/${FARM_ID:-}}

HOST="127.0.0.1"
PORT="5555"
API_HOST="127.0.0.1"
API_PORT="${CUSTOM_API_PORT:-9100}"
DEVICES=""
GRID=""
BLOCK=""
SLICE=""
ALGO="${CUSTOM_ALGO:-}"
EXTRA_ARGS_TOKENS=()
EXTRA_PROGRAMS_LIST=()

if [[ -n "${CUSTOM_URL:-}" ]]; then
  url_candidates=$(printf '%s\n' "$CUSTOM_URL" | tr ',\n\r\t' ' ')
  for endpoint in $url_candidates; do
    endpoint=$(trim_whitespace "$endpoint")
    [[ -z "$endpoint" ]] && continue
    parse_host_port_from_endpoint "$endpoint"
  done
fi

if [[ -n "${CUSTOM_PASS:-}" ]]; then
  # Optionally allow overriding host/port style "host:port" in pass field
  pass_value=$(trim_whitespace "$(strip_quotes "$CUSTOM_PASS")")
  if [[ $pass_value == *:* && $pass_value != *://* ]]; then
    parse_host_port_from_endpoint "$pass_value"
  fi
fi

if [[ -n "${CUSTOM_USER_CONFIG:-}" ]]; then
  mapfile -d '' -t _tokens < <(tokenize_user_config "$CUSTOM_USER_CONFIG")
  token_count=${#_tokens[@]}
  if (( token_count > 0 )); then
    declare -a _consumed
    for ((i=0; i<token_count; i++)); do
      _consumed[$i]=0
    done

    for ((i=0; i<token_count; i++)); do
      token=${_tokens[$i]}
      trimmed=$(trim_whitespace "$token")
      if [[ -z "$trimmed" ]]; then
        _consumed[$i]=1
        continue
      fi

      lower=${trimmed,,}

      if [[ $lower == -- ]]; then
        _consumed[$i]=1
        for ((j=i+1; j<token_count; j++)); do
          value=$(strip_quotes "$(trim_whitespace "${_tokens[$j]}")")
          _consumed[$j]=1
          [[ -n "$value" ]] && EXTRA_ARGS_TOKENS+=("$value")
        done
        break
      fi

      handled=false
      case "$lower" in
        --address|--wallet|address|wallet)
          handled=true
          _consumed[$i]=1
          if (( i + 1 < token_count )); then
            value=$(strip_quotes "$(trim_whitespace "${_tokens[$((i + 1))]}")")
            _consumed[$((i + 1))]=1
            if [[ -n "$value" ]]; then
              set_config_value "address" "$value" || true
            else
              warn "$trimmed requires a value"
            fi
          else
            warn "$trimmed requires a value"
          fi
          ;;
        --host|--server)
          handled=true
          _consumed[$i]=1
          if (( i + 1 < token_count )); then
            value=$(strip_quotes "$(trim_whitespace "${_tokens[$((i + 1))]}")")
            _consumed[$((i + 1))]=1
            if [[ -n "$value" ]]; then
              set_config_value "host" "$value" || true
            else
              warn "$trimmed requires a value"
            fi
          else
            warn "$trimmed requires a value"
          fi
          ;;
        --coordinator)
          handled=true
          _consumed[$i]=1
          if (( i + 1 < token_count )); then
            value=$(strip_quotes "$(trim_whitespace "${_tokens[$((i + 1))]}")")
            _consumed[$((i + 1))]=1
            if [[ -n "$value" ]]; then
              add_coordinator_tokens_from_value "$value"
            else
              warn "$trimmed requires a value"
            fi
          else
            warn "$trimmed requires a value"
          fi
          ;;
        --port|--coordinator-port|--server-port)
          handled=true
          _consumed[$i]=1
          if (( i + 1 < token_count )); then
            value=$(strip_quotes "$(trim_whitespace "${_tokens[$((i + 1))]}")")
            _consumed[$((i + 1))]=1
            if [[ -n "$value" ]]; then
              set_config_value "port" "$value" || true
            else
              warn "$trimmed requires a value"
            fi
          else
            warn "$trimmed requires a value"
          fi
          ;;
        --api-host|--api_host)
          handled=true
          _consumed[$i]=1
          if (( i + 1 < token_count )); then
            value=$(strip_quotes "$(trim_whitespace "${_tokens[$((i + 1))]}")")
            _consumed[$((i + 1))]=1
            if [[ -n "$value" ]]; then
              set_config_value "api_host" "$value" || true
            else
              warn "$trimmed requires a value"
            fi
          else
            warn "$trimmed requires a value"
          fi
          ;;
        --api-port|--api_port)
          handled=true
          _consumed[$i]=1
          if (( i + 1 < token_count )); then
            value=$(strip_quotes "$(trim_whitespace "${_tokens[$((i + 1))]}")")
            _consumed[$((i + 1))]=1
            if [[ -n "$value" ]]; then
              set_config_value "api_port" "$value" || true
            else
              warn "$trimmed requires a value"
            fi
          else
            warn "$trimmed requires a value"
          fi
          ;;
        --devices)
          handled=true
          _consumed[$i]=1
          if (( i + 1 < token_count )); then
            value=$(strip_quotes "$(trim_whitespace "${_tokens[$((i + 1))]}")")
            _consumed[$((i + 1))]=1
            if [[ -n "$value" ]]; then
              set_config_value "devices" "$value" || true
            else
              warn "$trimmed requires a value"
            fi
          else
            warn "$trimmed requires a value"
          fi
          ;;
        --run|run)
          handled=true
          _consumed[$i]=1
          if (( i + 1 < token_count )); then
            value=$(strip_quotes "$(trim_whitespace "${_tokens[$((i + 1))]}")")
            _consumed[$((i + 1))]=1
            if [[ -n "$value" ]]; then
              set_config_value "run" "$value" || true
            else
              warn "$trimmed requires a value"
            fi
          else
            warn "$trimmed requires a value"
          fi
          ;;
        --grid)
          handled=true
          _consumed[$i]=1
          if (( i + 1 < token_count )); then
            value=$(strip_quotes "$(trim_whitespace "${_tokens[$((i + 1))]}")")
            _consumed[$((i + 1))]=1
            if [[ -n "$value" ]]; then
              set_config_value "grid" "$value" || true
            else
              warn "$trimmed requires a value"
            fi
          else
            warn "$trimmed requires a value"
          fi
          ;;
        --block)
          handled=true
          _consumed[$i]=1
          if (( i + 1 < token_count )); then
            value=$(strip_quotes "$(trim_whitespace "${_tokens[$((i + 1))]}")")
            _consumed[$((i + 1))]=1
            if [[ -n "$value" ]]; then
              set_config_value "block" "$value" || true
            else
              warn "$trimmed requires a value"
            fi
          else
            warn "$trimmed requires a value"
          fi
          ;;
        --slice)
          handled=true
          _consumed[$i]=1
          if (( i + 1 < token_count )); then
            value=$(strip_quotes "$(trim_whitespace "${_tokens[$((i + 1))]}")")
            _consumed[$((i + 1))]=1
            if [[ -n "$value" ]]; then
              set_config_value "slice" "$value" || true
            else
              warn "$trimmed requires a value"
            fi
          else
            warn "$trimmed requires a value"
          fi
          ;;
        --algo|--algorithm)
          handled=true
          _consumed[$i]=1
          if (( i + 1 < token_count )); then
            value=$(strip_quotes "$(trim_whitespace "${_tokens[$((i + 1))]}")")
            _consumed[$((i + 1))]=1
            if [[ -n "$value" ]]; then
              set_config_value "algo" "$value" || true
            else
              warn "$trimmed requires a value"
            fi
          else
            warn "$trimmed requires a value"
          fi
          ;;
        --extra-args|--extra|--miner-args)
          handled=true
          _consumed[$i]=1
          if (( i + 1 < token_count )); then
            value=$(strip_quotes "$(trim_whitespace "${_tokens[$((i + 1))]}")")
            _consumed[$((i + 1))]=1
            if [[ -n "$value" ]]; then
              EXTRA_ARGS_TOKENS+=("$value")
            else
              warn "$trimmed requires a value"
            fi
          else
            warn "$trimmed requires a value"
          fi
          ;;
      esac

      if $handled; then
        continue
      fi

      if [[ "$trimmed" == *=* ]]; then
        key=${trimmed%%=*}
        value=${trimmed#*=}
        key=$(strip_quotes "$(trim_whitespace "$key")")
        value=$(strip_quotes "$(trim_whitespace "$value")")
        if [[ -n "$key" ]]; then
          if set_config_value "$key" "$value"; then
            _consumed[$i]=1
            continue
          fi
        fi
      fi

      if [[ "$trimmed" == *:* && "$trimmed" != *://* ]]; then
        key=${trimmed%%:*}
        value=${trimmed#*:}
        key=$(strip_quotes "$(trim_whitespace "$key")")
        value=$(strip_quotes "$(trim_whitespace "$value")")
        if [[ -n "$key" ]]; then
          if set_config_value "$key" "$value"; then
            _consumed[$i]=1
            continue
          fi
        fi
      fi
    done

    for ((i=0; i<token_count; i++)); do
      if (( _consumed[$i] )); then
        continue
      fi
      value=$(strip_quotes "$(trim_whitespace "${_tokens[$i]}")")
      [[ -z "$value" ]] && continue
      EXTRA_ARGS_TOKENS+=("$value")
    done
  fi
fi

ADDRESS=$(trim_whitespace "$ADDRESS")
[[ -z "$ADDRESS" ]] && error "Wallet address is empty after processing flight sheet"

HOST=$(trim_whitespace "$HOST")
[[ -z "$HOST" ]] && HOST="127.0.0.1"

PORT=$(trim_whitespace "$PORT")
if [[ -z "$PORT" || ! $PORT =~ ^[0-9]+$ ]]; then
  warn "Invalid or missing port '$PORT', falling back to 5555"
  PORT="5555"
fi

ensure_coordinator_tokens

API_HOST=$(trim_whitespace "$API_HOST")
[[ -z "$API_HOST" ]] && API_HOST="127.0.0.1"

API_PORT=$(trim_whitespace "$API_PORT")
if [[ -z "$API_PORT" || ! $API_PORT =~ ^[0-9]+$ ]]; then
  warn "Invalid API port '$API_PORT', falling back to ${CUSTOM_API_PORT:-9100}"
  API_PORT="${CUSTOM_API_PORT:-9100}"
fi

DEVICES=$(strip_quotes "$(trim_whitespace "$DEVICES")")
GRID=$(strip_quotes "$(trim_whitespace "$GRID")")
BLOCK=$(strip_quotes "$(trim_whitespace "$BLOCK")")
SLICE=$(strip_quotes "$(trim_whitespace "$SLICE")")
ALGO=$(strip_quotes "$(trim_whitespace "$ALGO")")

mkdir -p "$(dirname "$CONFIG_FILE")"

{
  printf 'ADDRESS=%q\n' "$ADDRESS"
  printf 'HOST=%q\n' "$HOST"
  printf 'PORT=%q\n' "$PORT"
  if ((${#COORDINATOR_TOKENS[@]})); then
    printf 'COORDINATORS=%q\n' "$(printf '%s\n' "${COORDINATOR_TOKENS[@]}")"
  else
    printf 'COORDINATORS=%q\n' ""
  fi
  printf 'API_HOST=%q\n' "$API_HOST"
  printf 'API_PORT=%q\n' "$API_PORT"
  printf 'DEVICES=%q\n' "$DEVICES"
  printf 'GRID=%q\n' "$GRID"
  printf 'BLOCK=%q\n' "$BLOCK"
  printf 'SLICE=%q\n' "$SLICE"
  printf 'ALGO=%q\n' "$ALGO"
  if ((${#EXTRA_ARGS_TOKENS[@]})); then
    printf 'EXTRA_ARGS=%q\n' "$(printf '%s\n' "${EXTRA_ARGS_TOKENS[@]}")"
  else
    printf 'EXTRA_ARGS=%q\n' ""
  fi
  if ((${#EXTRA_PROGRAMS_LIST[@]})); then
    printf 'EXTRA_PROGRAMS=%q\n' "$(printf '%s\n' "${EXTRA_PROGRAMS_LIST[@]}")"
  else
    printf 'EXTRA_PROGRAMS=%q\n' ""
  fi
} > "$CONFIG_FILE"

chmod 600 "$CONFIG_FILE" 2>/dev/null || true
echo "Configuration written to $CONFIG_FILE"
