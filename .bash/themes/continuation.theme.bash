#!/usr/bin/env bash

function prompt_command() {
  local start_smooth=$arc_down_and_right
  local stop_smooth_square=$arc_up_and_right$square
  local stop_smooth_rhombus=$arc_up_and_right$rhombus

  local git_status
  git_status=$(__git_ps1 " ( %s)")

  local BOLD
  BOLD="${PROMPT_EMPHASIS["BOLD"]}"
  local OFF
  OFF="${PROMPT_EMPHASIS["REGULAR"]}"

  PS1="$BOLD${PROMPT_FG["YELLOW"]}$start_smooth"
  PS1+="$BOLD${PROMPT_FG["CYAN"]}\u"
  PS1+="$BOLD${PROMPT_FG["YELLOW"]}@"
  PS1+="$BOLD${PROMPT_FG["MAGENTA"]}\h"
  PS1+="$BOLD${PROMPT_FG["YELLOW"]}$hourglass"
  PS1+="$BOLD${PROMPT_FG["BLUE"]}|\t|"
  PS1+="$BOLD${PROMPT_FG["YELLOW"]}:"
  PS1+="$BOLD${PROMPT_FG["RED"]}[\w]"
  PS1+="$BOLD${PROMPT_FG["YELLOW"]}$git_status$OFF\n"
  PS1+="$BOLD${PROMPT_FG["YELLOW"]}$stop_smooth_square$OFF "

  # Continuation Prompt
  PS2="$BOLD${PROMPT_FG["YELLOW"]}$stop_smooth_square $OFF "
}
PROMPT_COMMAND=prompt_command;
