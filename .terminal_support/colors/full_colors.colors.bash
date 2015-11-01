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

create_full_color_name() {
  local emphasis_type
  local fg_color
  local bg_color

  emphasis_type="$1"
  fg_color="$2"
  bg_color="$3"

  local full_color_name
  full_color_name=""

  if [[ $emphasis_type != "REGULAR" ]]; then
    full_color_name+="$emphasis_type""_"
  fi
  full_color_name+="$fg_color"

  if [[ $bg_color != "" ]]; then
    full_color_name+="_ON_""$bg_color"
  fi
  echo "$full_color_name"
}

create_colors() {
  local color_name
  local color_sequence

  # Font Type
  declare -A EMPHASIS_CODE

  EMPHASIS_CODE["REGULAR"]=0
  EMPHASIS_CODE["BOLD"]=1
  EMPHASIS_CODE["DIM"]=2
  EMPHASIS_CODE["UNDERLINED"]=4

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
  declare -A FG_COLORS

  local fg_color_name
  for fg_type in ${!FG_COLOR_TYPE[@]}; do
    for code in ${!COLOR_CODE[@]}; do
      fg_color_name=$(name_color "$fg_type" "$code")
      FG_COLORS["$fg_color_name"]="${FG_COLOR_TYPE[$fg_type]}""${COLOR_CODE[$code]}"
    done
  done
  # Add default foreground color.
  FG_COLORS["DEFAULT"]=39

  # Create Foreground Colors
  declare -A BG_COLORS

  local bg_color_name
  for bg_type in ${!BG_COLOR_TYPE[@]}; do
    for code in ${!COLOR_CODE[@]}; do
      bg_color_name=$(name_color "$bg_type" "$code")
      BG_COLORS["$bg_color_name"]="${BG_COLOR_TYPE[$bg_type]}""${COLOR_CODE[$code]}"
    done
  done
  # Add default background color.
  BG_COLORS["DEFAULT"]=49

  # FORMAT="\\\e[${EMPHASIS_CODE};${FG_COLORS};${BG_COLORS}m"
  local FORMAT
  FORMAT="\\\e[%u;%u;%um"

  for ii in ${!EMPHASIS_CODE[@]}; do
    for jj in ${!FG_COLORS[@]}; do
      for kk in ${!BG_COLORS[@]}; do
        color_name=$(create_full_color_name "$ii" "$jj" "$kk")
        color_sequence=$(printf "$FORMAT" "${EMPHASIS_CODE[$ii]}"\
                         "${FG_COLORS[$jj]}" "${BG_COLORS[$kk]}")
        COLORS["$color_name"]="$color_sequence"
      done
    done
  done

  # FORMAT_WITHOUT_BG="\\\e[${EMPHASIS_CODE};${FG_COLORS}m"
  local FORMAT_WITHOUT_BG
  FORMAT_WITHOUT_BG="\\\e[%u;%um"

  for ii in ${!EMPHASIS_CODE[@]}; do
    for jj in ${!FG_COLORS[@]}; do
      color_name=$(create_full_color_name "$ii" "$jj" "")
      color_sequence=$(printf "$FORMAT_WITHOUT_BG" "${EMPHASIS_CODE[$ii]}"\
                       "${FG_COLORS[$jj]}")
      COLORS["$color_name"]="$color_sequence"
    done
  done
}

create_prompt_colors() {
  local value

  for key in "${!COLORS[@]}"; do
    value="${COLORS[$key]}"
    PROMPT_COLORS["$key"]="\[$value\]"
  done
}

# Text Reset
COLOR_OFF='\e[0m'
PROMPT_COLOR_OFF='\[\e[0m\]'

# Clear to the end of line
CLEAR_EOL='\e[K'
PROMPT_CLEAR_EOL='\[\e[K\]'

declare -A COLORS
create_colors

declare -A PROMPT_COLORS
create_prompt_colors
