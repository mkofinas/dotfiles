#!/usr/bin/env bash

current_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -f $current_directory"/../colors/foreground_colors.bash" ]; then
  . $current_directory"/../colors/foreground_colors.bash"
fi

if [ -f $current_directory"/../colors/background_colors.bash" ]; then
  . $current_directory"/../colors/background_colors.bash"
fi

if [ -f $current_directory"/../symbols/box_drawing_symbols.bash" ]; then
  . $current_directory"/../symbols/box_drawing_symbols.bash"
fi

if [ -f $current_directory"/../symbols/arrow_symbols.bash" ]; then
  . $current_directory"/../symbols/arrow_symbols.bash"
fi

if [ -f $current_directory"/../symbols/misc_symbols.bash" ]; then
  . $current_directory"/../symbols/misc_symbols.bash"
fi

function prompt_command() {
  local echo_bold_light_yellow="\[$bold_light_yellow\]"
  local echo_bold_blue="\[$bold_blue\]"
  local echo_bold_light_cyan="\[$bold_light_cyan\]"
  local echo_bold_light_purple="\[$bold_light_purple\]"
  local echo_bold_light_red="\[$bold_light_red\]"
  local echo_bold_light_green="\[$bold_light_green\]"
  local echo_color_off="\[$color_off\]"
  local echo_on_black="\[$on_black\]"

  local git_status
  git_status=$(__git_ps1 " ( %s)")

  BG_PROMPT="$echo_on_black$clear_eol"
  L1_PROMPT_LEFT="$echo_bold_light_yellow$user"
  L1_PROMPT_LEFT+="$echo_bold_light_cyan\u"
  L1_PROMPT_LEFT+="$echo_bold_light_yellow@"
  L1_PROMPT_LEFT+="$echo_bold_light_purple\h"
  L1_PROMPT_LEFT+="$echo_bold_light_yellow:"
  L1_PROMPT_LEFT+="$echo_bold_light_red[\w]"
  L1_PROMPT_LEFT+="$echo_bold_light_yellow$git_status"

  L1_PROMPT_LEFT_SIZE=`expand_prompt "$L1_PROMPT_LEFT"`

  local right_text
  right_text="\t"
  L1_PROMPT_RIGHT="\$(write_at_end_of_line "$right_text")"
  L1_PROMPT_RIGHT_SIZE=`expand_prompt "$right_text"`
  L1_PROMPT_RIGHT="$echo_bold_light_blue$L1_PROMPT_RIGHT"

  local available_width
  available_width=$((`tput cols` - $L1_PROMPT_LEFT_SIZE))
  if [[ $available_width -ge $L1_PROMPT_RIGHT_SIZE ]]; then
    L1_PROMPT="$L1_PROMPT_LEFT$L1_PROMPT_RIGHT$echo_color_off\n"
  else
    L1_PROMPT="$L1_PROMPT_LEFT$echo_color_off\n"
  fi

  # Second Prompt Line
  if [[ $system_exit_wrong == 1 ]]; then
      L2_PROMPT="$echo_bold_light_red$heavy_long_right_arrow$echo_color_off "
  else
      L2_PROMPT="$echo_bold_light_green$heavy_long_right_arrow$echo_color_off "
  fi

  PS1=$BG_PROMPT$L1_PROMPT$L2_PROMPT

  # Continuation Prompt
  PS2="$echo_bold_light_green$heavy_long_right_arrow $echo_bold_white...$echo_color_off "
}
PROMPT_COMMAND=prompt_command;
