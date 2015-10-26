#!/usr/bin/env bash

set_system_exit_status() {
  if [[ "$?" = "0" ]]; then
    system_exit_wrong=0
  else
    system_exit_wrong=1
  fi
}
