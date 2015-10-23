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
  local start_smooth=$arc_down_and_right
  local stop_smooth_square=$arc_up_and_right$square
  local stop_smooth_rhombus=$arc_up_and_right$rhombus

  local echo_bold_light_yellow="\[$bold_light_yellow\]"
  local echo_bold_blue="\[$bold_blue\]"
  local echo_bold_light_cyan="\[$bold_light_cyan\]"
  local echo_bold_light_purple="\[$bold_light_purple\]"
  local echo_bold_light_red="\[$bold_light_red\]"
  local echo_bold_light_green="\[$bold_light_green\]"
  local echo_color_off="\[$color_off\]"

  # More symbols at:
  # http://www.sabinanore.com/design/html-special-symbols/
  # http://panmental.de/symbols/info.htm

  # PS1="\u@\h:\w\$(__git_ps1)\$$color_off "

  # PS1="$bold_light_yellow$start_smooth$bold_light_cyan\u$bold_light_yellow@$bold_light_purple\h$bold_light_yellow$hourglass$bold_blue|\t|$bold_light_yellow:$bold_light_red[\w]$bold_light_yellow\$(__git_ps1)$color_off\n$bold_light_yellow$stop_smooth_square$color_off "

  PS1="$echo_bold_light_yellow$clock"
  PS1+="$echo_bold_blue|\t|"
  PS1+="$echo_bold_light_yellow$down_zigzag_arrow"
  PS1+="$echo_bold_light_cyan\u"
  PS1+="$echo_bold_light_yellow@"
  PS1+="$echo_bold_light_purple\h"
  PS1+="$echo_bold_light_yellow:"
  PS1+="$echo_bold_light_red[\w]"
  PS1+="$echo_bold_light_yellow"'$(__git_ps1 " ( %s)")'"$echo_color_off\n"
  if [[ $system_exit_wrong == 1 ]]; then
      PS1+="$echo_bold_light_red$heavy_long_right_arrow$echo_color_off "
  else
      PS1+="$echo_bold_light_green$heavy_long_right_arrow$echo_color_off "
  fi

  PS2="$echo_bold_light_green$heavy_long_right_arrow $echo_bold_white...$echo_color_off "

  # PS2="$echo_bold_light_green$asterism$echo_color_off "
}
PROMPT_COMMAND=prompt_command;
