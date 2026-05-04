#!/bin/bash
original_dir=$(pwd)
node_dir="/opt/node/piratecash"
conf_file="$node_dir/piratecash.conf"
env_file="$original_dir/.env"

random_token() {
  openssl rand -base64 12 | tr -d '/+=' | cut -c1-"$1"
}

get_conf_value() {
  if [ -f "$conf_file" ]; then
    sed -n "s/^$1=//p" "$conf_file" | tail -n 1
  fi
}

get_env_value() {
  if [ -f "$env_file" ]; then
    sed -n "s/^$1=//p" "$env_file" | tail -n 1
  fi
}

set_env_key() {
  key="$1"
  value="$2"

  touch "$env_file"
  if grep -q "^$key=" "$env_file"; then
    sed -i "s|^$key=.*|$key=$value|" "$env_file"
  else
    printf '%s=%s\n' "$key" "$value" >> "$env_file"
  fi
}

ensure_env_key() {
  key="$1"
  value="$2"

  if [ -z "$(get_env_value "$key")" ]; then
    set_env_key "$key" "$value"
  fi
}

set_conf_key() {
  key="$1"
  value="$2"

  if grep -q "^$key=" "$conf_file"; then
    sed -i "s|^$key=.*|$key=$value|" "$conf_file"
  elif grep -q "^#$key=" "$conf_file"; then
    sed -i "s|^#$key=.*|$key=$value|" "$conf_file"
  else
    printf '%s=%s\n' "$key" "$value" >> "$conf_file"
  fi
}

ensure_corsa_config() {
  mkdir -p "$node_dir"
  if [ ! -f "$conf_file" ]; then
    cp -f "$original_dir/piratecash-main/piratecash.conf" "$conf_file"
  fi

  corsa_rpc_username=$(get_conf_value corsarpcuser)
  if [ -z "$corsa_rpc_username" ]; then
    corsa_rpc_username=$(get_env_value CORSA_RPC_USERNAME)
  fi
  if [ -z "$corsa_rpc_username" ]; then
    corsa_rpc_username=$(random_token 12)
  fi

  corsa_rpc_password=$(get_conf_value corsarpcpassword)
  if [ -z "$corsa_rpc_password" ]; then
    corsa_rpc_password=$(get_env_value CORSA_RPC_PASSWORD)
  fi
  if [ -z "$corsa_rpc_password" ]; then
    corsa_rpc_password=$(random_token 16)
  fi

  set_conf_key corsarpcuser "$corsa_rpc_username"
  set_conf_key corsarpcpassword "$corsa_rpc_password"
  set_conf_key corsarpcport 46464

  umask 077
  touch "$env_file"
  chmod 600 "$env_file"
  ensure_env_key CORSA_LISTEN_ADDRESS ":64646"
  ensure_env_key CORSA_BOOTSTRAP_PEERS "65.108.204.190:64646"
  ensure_env_key CORSA_RPC_HOST "0.0.0.0"
  ensure_env_key CORSA_RPC_PORT "46464"
  set_env_key CORSA_RPC_USERNAME "$corsa_rpc_username"
  set_env_key CORSA_RPC_PASSWORD "$corsa_rpc_password"

  chown -R 1001:1001 "$node_dir"
}

ensure_corsa_config
docker compose up --build -d
