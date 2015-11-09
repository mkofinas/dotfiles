#!/usr/bin/env bash

cpu_temperature() {
  # Temperatures of all the CPU's logical cores.
  local cpu_temperatures
  cpu_temperatures=($(sensors | grep "Core" | sed 's/.*:\s*+\(.*\)..°C.*(.*/\1/'))

  local max_core_temperature
  max_core_temperature=0

  for core_temperature in "${cpu_temperatures[@]}"; do
    if [[ $core_temperature -gt $max_core_temperature ]]; then
      max_core_temperature=$core_temperature
    fi
  done

  local low_temperature_high_limit
  local high_temperature_low_limit
  low_temperature_high_limit=60
  high_temperature_low_limit=95

  local temperature_color
  if [[ $max_core_temperature -le $low_temperature_high_limit ]]; then
    temperature_color="\e[0;32m"
  elif [[ $max_core_temperature -le $high_temperature_low_limit ]]; then
    temperature_color="\e[0;33m"
  else
    temperature_color="\e[0;31m"
  fi

  echo $temperature_color" "
}
