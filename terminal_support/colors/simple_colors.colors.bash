#!/usr/bin/env bash

name_color() {
  local color_type
  local color
  color_type="$1"
  color="$2"

  local color_name
  color_name=""
  if [[ $color_type != "NORMAL" ]]; then
    color_name+="$color_type""_"
  fi
  color_name+="$color"

  echo "$color_name"
}

create_emphasis() {
  # Font Type
  declare -A EMPHASIS_CODE

  EMPHASIS_CODE["REGULAR"]=0
  EMPHASIS_CODE["BOLD"]=1
  EMPHASIS_CODE["DIM"]=2
  EMPHASIS_CODE["UNDERLINED"]=4

  # Create Emphasis Sequences
  for code in ${!EMPHASIS_CODE[@]}; do
    EMPHASIS["$code"]="\e[""${EMPHASIS_CODE[$code]}""m"
  done
}

create_fg_bg() {
  local color_name
  local color_sequence

  # Color Codes
  declare -A COLOR_CODE

  COLOR_CODE["BLACK"]=0
  COLOR_CODE["RED"]=1
  COLOR_CODE["GREEN"]=2
  COLOR_CODE["YELLOW"]=3
  COLOR_CODE["BLUE"]=4
  COLOR_CODE["MAGENTA"]=5
  COLOR_CODE["CYAN"]=6
  COLOR_CODE["WHITE"]=7

  # Foreground Color Types
  declare -A FG_COLOR_TYPE

  FG_COLOR_TYPE["NORMAL"]=3
  FG_COLOR_TYPE["LIGHT"]=9

  # Background Color Types
  declare -A BG_COLOR_TYPE

  BG_COLOR_TYPE["NORMAL"]=4
  BG_COLOR_TYPE["LIGHT"]=10


  # Create Foreground Colors
  local fg_color_name
  for fg_type in ${!FG_COLOR_TYPE[@]}; do
    for code in ${!COLOR_CODE[@]}; do
      fg_color_name=$(name_color "$fg_type" "$code")
      FG["$fg_color_name"]="\e[""${FG_COLOR_TYPE[$fg_type]}""${COLOR_CODE[$code]}""m"
    done
  done
  # Add default foreground color
  FG["DEFAULT"]="\e[39m"

  # Create Foreground Colors
  local bg_color_name
  for bg_type in ${!BG_COLOR_TYPE[@]}; do
    for code in ${!COLOR_CODE[@]}; do
      bg_color_name=$(name_color "$bg_type" "$code")
      BG["$bg_color_name"]="\e[""${BG_COLOR_TYPE[$bg_type]}""${COLOR_CODE[$code]}""m"
    done
  done
  # Add default background color.
  BG["DEFAULT"]="\e[49m"
}

create_prompt_colors() {
  local value

  for key in "${!FG[@]}"; do
    value="${FG[$key]}"
    PROMPT_FG["$key"]="\[$value\]"
  done

  for key in "${!BG[@]}"; do
    value="${BG[$key]}"
    PROMPT_BG["$key"]="\[$value\]"
  done

  for key in "${!EMPHASIS[@]}"; do
    value="${EMPHASIS[$key]}"
    PROMPT_EMPHASIS["$key"]="\[$value\]"
  done
}

# Clear to the end of line
CLEAR_EOL='\e[K'
PROMPT_CLEAR_EOL='\[\e[K\]'

declare -A EMPHASIS
declare -A FG
declare -A BG
create_emphasis
create_fg_bg

declare -A PROMPT_EMPHASIS
declare -A PROMPT_FG
declare -A PROMPT_BG
create_prompt_colors
