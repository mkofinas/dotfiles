################################################################################
# Zsh Configuration                                                            #
# -------------------------                                                    #
# 1. Source Prezto                                                             #
# 2. Plugin Manager: Zplug                                                     #
# 3. Source Files                                                              #
# 4. Aliases                                                                   #
# 5. Plugin Settings                                                           #
# -------------------------                                                    #
# Author(s):                                                                   #
# - Miltiadis Kofinas <mkofinas@gmail.com>                                     #
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
# Check if zplug is installed
[[ -d ~/.zplug ]] || {
  git clone https://github.com/b4b4r07/zplug ~/.zplug
  source ~/.zplug/zplug && zplug update --self
}

source ~/.zplug/zplug

# ZPlug
zplug "b4b4r07/zplug"

# External Plugins
zplug "rupa/z", of:z.sh
zplug "zsh-users/zsh-autosuggestions"
zplug "supercrabtree/k"
zplug "Tarrasch/zsh-bd"
zplug "chriskempson/base16-shell", of:"base16-atelierforest.dark.sh"
# zplug "mkofinas/oh-my-zsh-git"
# zplug "mkofinas/zeta-sigma-zsh-theme"
zplug "b4b4r07/zsh-vimode-visual", of:"zsh-vimode-visual.sh", nice:19
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-history-substring-search", nice:11

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
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

# Configuration Files
alias zshrc="$EDITOR ~/.zshrc"
alias szsh="source ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias nvrc="$EDITOR ~/.config/nvim/init.vim"
alias bashrc="$EDITOR ~/.bashrc"
alias sbash="source ~/.bashrc"
alias ipyrc="$EDITOR ~/.ipython/profile_default/ipython_config.py"
alias tmrc="$EDITOR ~/.tmux.conf"
alias zsh_theme="$EDITOR $ZPLUG_HOME/repos/mkofinas/zeta-sigma-zsh-theme/zeta_sigma.zsh-theme"
# 1}}}
################################################################################

################################################################################
# Plugin Settings {{{1
################################################################################

################################################################################
# History Substring Search {{{2
################################################################################
# Ignore all duplicates from search
setopt HIST_IGNORE_ALL_DUPS

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

eval "$(thefuck --alias)"

# vim:foldmethod=marker:foldlevel=0:foldenable
