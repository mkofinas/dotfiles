#!/usr/bin/env bash

function prompt_command() {

  local git_status
  git_status=$(__git_ps1 " ( %s)")

  local BOLD
  BOLD="${PROMPT_EMPHASIS["BOLD"]}"
  local OFF
  OFF="${PROMPT_EMPHASIS["REGULAR"]}"

  # PS1="\u@\h:\w\$(__git_ps1)\$$OFF "
  L1_PROMPT_LEFT="$BOLD${PROMPT_FG["CYAN"]}\u"
  L1_PROMPT_LEFT+="$BOLD${PROMPT_FG["YELLOW"]}@"
  L1_PROMPT_LEFT+="$BOLD${PROMPT_FG["MAGENTA"]}\h"
  L1_PROMPT_LEFT+="$BOLD${PROMPT_FG["YELLOW"]}:"
  L1_PROMPT_LEFT+="$BOLD${PROMPT_FG["RED"]}[\w]"
  L1_PROMPT_LEFT+="$BOLD${PROMPT_FG["YELLOW"]}$git_status"

  L1_PROMPT="$L1_PROMPT_LEFT$PROMPT_COLOR_OFF\n"

  # Second Prompt Line
  if [[ $system_exit_wrong == 1 ]]; then
      L2_PROMPT="$BOLD${PROMPT_FG["RED"]}$heavy_long_right_arrow$OFF "
  else
      L2_PROMPT="$BOLD${PROMPT_FG["GREEN"]}$heavy_long_right_arrow$OFF "
  fi

  PS1=$L1_PROMPT$L2_PROMPT

  # Continuation Prompt
  PS2="$BOLD${PROMPT_FG["GREEN"]}$heavy_long_right_arrow ...$OFF "
  # PS2="$BOLD${PROMPT_FG["GREEN"]}$asterism$OFF "
}
PROMPT_COMMAND=prompt_command;
