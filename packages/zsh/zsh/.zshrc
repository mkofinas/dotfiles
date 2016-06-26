################################################################################
# Zsh Configuration                                                            #
# -------------------------                                                    #
# 1. Print Random Quote                                                        #
# 2. Source Prezto                                                             #
# 3. Plugin Manager: Zplug                                                     #
# 4. Source Files                                                              #
# 5. Aliases                                                                   #
# 6. Keybindings                                                               #
# 7. Plugin Settings                                                           #
# -------------------------                                                    #
# Author(s):                                                                   #
# - Miltiadis Kofinas <mkofinas@gmail.com>                                     #
################################################################################

################################################################################
# Print Random Quote {{{1
################################################################################
# Print a random, hopefully interesting, adage.
if (( $+commands[python] )); then
  if [[ -t 0 || -t 1 ]]; then
    if [[ -f ${HOME}/My-Repos/random-quotes/print_random_quote.py ]]; then
      bash ${HOME}/My-Repos/random-quotes/print_random_quote.sh
      # python ${HOME}/My-Repos/random-quotes/print_random_quote.py
    fi
  fi
fi
# 1}}}
################################################################################

################################################################################
# Source Prezto {{{1
################################################################################
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
# 1}}}
################################################################################

################################################################################
# Plugin Manager: Zplug {{{1
################################################################################
export ZPLUG_HOME="${ZDOTDIR:-$HOME}/.zplug"
# Check if zplug is installed
if [[ ! -d "${ZPLUG_HOME}" ]]; then
  git clone https://github.com/zplug/zplug "${ZPLUG_HOME}"
  source "${ZPLUG_HOME}/init.zsh" && zplug update --self
fi

source "${ZPLUG_HOME}/init.zsh"

################################################################################
# Commands {{{2
################################################################################
zplug "rupa/z", use:z.sh
zplug "supercrabtree/k"
zplug "Tarrasch/zsh-bd"
zplug "b4b4r07/zsh-vimode-visual", use:"zsh-vimode-visual.sh", nice:19
# 2}}}
################################################################################

################################################################################
# Display {{{2
################################################################################
# zplug "mkofinas/zeta-sigma-zsh-theme"
zplug "chriskempson/base16-shell", use:"base16-atelierforest.dark.sh"
# zplug "zsh-users/zsh-syntax-highlighting", nice:10
# 2}}}
################################################################################

################################################################################
# Interface {{{2
################################################################################
# zplug "mkofinas/oh-my-zsh-git"
# zplug "zsh-users/zsh-autosuggestions", nice:12
# zplug "zsh-users/zsh-history-substring-search", nice:11
# 2}}}
################################################################################

# Install packages that have not been installed yet
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi

# Then, source plugins and add commands to $PATH
echo "Loading plugins..."
zplug load  # --verbose
# 1}}}
################################################################################

################################################################################
# Source Files {{{1
################################################################################

################################################################################
# ROS {{{2
################################################################################
if [ -f /opt/ros/indigo/setup.zsh ]; then
  . /opt/ros/indigo/setup.zsh
fi

if [ -f ~/catkin_ws/devel/setup.zsh ]; then
  . ~/catkin_ws/devel/setup.zsh
fi

if [ -f ~/pandora_ws/devel/setup.zsh ]; then
  . ~/pandora_ws/devel/setup.zsh --extend
fi
# 2}}}
################################################################################

################################################################################
# Torch {{{2
################################################################################
. ~/Libraries/torch/install/bin/torch-activate
# 2}}}
################################################################################

################################################################################
# Fzf {{{2
################################################################################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# 2}}}
################################################################################

################################################################################
# Desktop Scripts {{{2
################################################################################
if [ -f ~/.desktop_scripts ]; then
  . ~/.desktop_scripts
fi
# 2}}}
################################################################################

# 1}}}
################################################################################

################################################################################
# Aliases {{{1
################################################################################
# C/C++ Compiler
alias compiler_gcc='export CC=gcc && export CXX=g++'
alias compiler_clang='export CC=clang && export CXX=clang++'

# ROS
alias master_local='export ROS_MASTER_URI=http://localhost:11311'
alias master_test='export ROS_MASTER_URI=http://localhost:22422'

# PANDORA Robotics
alias master_robot='export ROS_MASTER_URI=http://192.168.0.106:11311'
alias master_lab='export ROS_MASTER_URI=http://pandora-lab:11311'

alias make_victim='cd ~/pandora_ws && catkin_make --only-pkg-with-deps pandora_vision_victim'
alias make_motion='cd ~/pandora_ws && catkin_make --only-pkg-with-deps pandora_vision_motion'

# List Directories
alias l='ls -1F'
alias ll='ls -lh'
alias la='ls -lhA'
alias lr='ls -lhR'

# Change Directories
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'

# Make Directories
alias md='mkdir -p'

# Shortcuts
alias v="vim"
alias nv="nvim"
alias c="clear"
alias jl="julia"
alias ff="firefox"
alias oo="xdg-open 2>/dev/null"

alias file-grep='grep -hHIrn'

# Git
alias ga='git add'
alias gst='git status'
alias gdf='git diff'

# Uncompress
alias x='unarchive'

# A list of all the one-letter aliases
alias salias='alias | grep "^[a-z]=" | sort'

# IPython - Jupyter
alias ipy='ipython'
alias itorch='jupyter console --kernel=itorch --config=~/.jupyter/itorch_console_config.py'
alias ith='itorch'
alias ijulia='jupyter console --kernel=julia-0.4 --config=~/.jupyter/ijulia_console_config.py'
alias ijl='ijulia'
alias jn='jupyter notebook'

# Mutt - XDG Specification
alias mutt="sudo mutt -F ${XDG_CONFIG_HOME:-${HOME}/.config}/mutt/muttrc"

# Latexmk - XDG Specification
alias latexmk="latexmk -r ${XDG_CONFIG_HOME:-${HOME}/.config}/latex/.latexmkrc"

# Tmux - XDG Specification
alias tmux="tmux -f ${XDG_CONFIG_HOME:-${HOME}/.config}/tmux/tmux.conf"

# Vim - XDG Specification
alias vim="vim -u ${XDG_CONFIG_HOME:-${HOME}/.config}/vim/vimrc"

# Configuration Files
alias zshrc="$EDITOR ${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/.zshrc"
alias szsh="source ${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/.zshrc"
alias vimrc="vim ~/.vimrc"
alias nvrc="$EDITOR ${XDG_CONFIG_HOME:-${HOME}/.config}/nvim/init.vim"
alias bashrc="$EDITOR ~/.bashrc"
alias sbash="source ~/.bashrc"
alias ipyrc="$EDITOR ~/.ipython/profile_default/ipython_config.py"
alias tmrc="$EDITOR ${XDG_CONFIG_HOME:-${HOME}/.config}/tmux/tmux.conf"
alias muttrc="$EDITOR ${XDG_CONFIG_HOME:-${HOME}/.config}/mutt/muttrc"
alias zsh_theme="$EDITOR $ZPLUG_HOME/repos/mkofinas/zeta-sigma-zsh-theme/zeta_sigma.zsh-theme"
# 1}}}
################################################################################

################################################################################
# Keybindings {{{1
################################################################################
for keymap in 'emacs' 'viins' 'vicmd'; do
  # [Ctrl-RightArrow] - move forward one word
  bindkey -M $keymap '^[[1;3C' forward-word
  # [Ctrl-LeftArrow] - move backward one word
  bindkey -M $keymap '^[[1;3D' backward-word
done
unset keymap
# 1}}}
################################################################################

################################################################################
# Plugin Settings {{{1
################################################################################

################################################################################
# Syntax Highlighting {{{2
################################################################################
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
# 2}}}
################################################################################

################################################################################
# History Substring Search {{{2
################################################################################

# Bind <Up, Down> keys for search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bindkey -M vicmd 'k' history-substring-search-up
# bindkey -M vicmd 'j' history-substring-search-down
# 2}}}
################################################################################

# 1}}}
################################################################################

# vim:foldmethod=marker:foldlevel=0:foldenable
