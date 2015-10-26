#!/usr/bin/env bash

get_cursor_position() {
  # from http://stackoverflow.com/questions/2575037/how-to-get-the-cursor-position-in-bash
  # based on a script from http://invisible-island.net/xterm/xterm.faq.html
  exec < /dev/tty
  oldstty=$(stty -g)
  stty raw -echo min 0
  # on my system, the following line can be replaced by the line below it
  echo -en "\033[6n" > /dev/tty
  # tput u7 > /dev/tty    # when TERM=xterm (and relatives)
  IFS=';' read -r -d R -a pos
  stty $oldstty
  # change from one-based to zero based so they work with: tput cup $row $col
  cursor_row=$((${pos[0]:2} - 1))    # strip off the esc-[
  cursor_col=$((${pos[1]} - 1))
}

write_at_end_of_line() {
  local output_str
  local output_str_len
  local col_to_begin

  get_cursor_position

  # Calculate string size (without escape characters)
  output_str=$(echo -en $1 | sed 's/\e\[[0-9\;]*m//g')
  output_str_len=${#output_str}

  col_to_begin=$(($(tput cols)- $output_str_len))
  tput sc
  tput cup $cursor_row $col_to_begin
  echo -en $1
  tput rc
}

expand_prompt() {
  local left_prompt
  local left_prompt_size
  left_prompt="$1"
  left_prompt=$(echo $left_prompt | \
                sed 's/\\\e\[[0-9\;]*m//g' | \
                sed 's/\\\[//g' | \
                sed 's/\\\]//g')

  left_prompt_size=${#left_prompt}

  local time_now
  time_now=$(date +%H:%M:%S)

  local current_dir
  if [[ $PWD == *"$HOME"* ]]; then
    current_dir=$(echo $PWD | sed "s:$HOME:~:")
  fi

  if [[ $left_prompt == *"\t"* ]]; then
    left_prompt_size=$((left_prompt_size - 2 + ${#time_now}))
  fi
  if [[ $left_prompt == *"\u"* ]]; then
    left_prompt_size=$((left_prompt_size - 2 + ${#USER}))
  fi
  if [[ $left_prompt == *"\h"* ]]; then
    left_prompt_size=$((left_prompt_size - 2 + ${#HOSTNAME}))
  fi
  if [[ $left_prompt == *"\w"* ]]; then
    left_prompt_size=$((left_prompt_size - 2 + ${#current_dir}))
  fi
  if [[ $left_prompt == *"\n"* ]]; then
    left_prompt_size=$((left_prompt_size - 2))
  fi
  echo $left_prompt_size
}
