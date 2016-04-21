################################################################################
# Zsh Configuration                                                            #
# -----------------                                                            #
# 1. Zplug Plugin Manager & Plugins                                            #
# 2. Export Variables & Source Files                                           #
# 3. Aliases                                                                   #
# 4. Set Vi Mode                                                               #
################################################################################

################################################################################
#                                    Zplug                                     #
################################################################################

# Check if zplug is installed
[[ -d ~/.zplug ]] || {
  git clone https://github.com/b4b4r07/zplug ~/.zplug
  source ~/.zplug/zplug && zplug update --self
}

source ~/.zplug/zplug

# ZPlug
zplug "b4b4r07/zplug"

# Oh-my-Zsh Plugins
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/virtualenv", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh

# External Plugins
zplug "rupa/z", of:z.sh
zplug "zsh-users/zsh-autosuggestions"
zplug "supercrabtree/k"
zplug "Tarrasch/zsh-bd"
zplug "chriskempson/base16-shell", of:"base16-atelierforest.dark.sh"
zplug "mkofinas/oh-my-zsh-git"
zplug "mkofinas/zeta-sigma-zsh-theme"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-history-substring-search", nice:11
#zplug "mafredri/zsh-async"
#zplug "sindresorhus/pure"
zplug "junegunn/fzf", as:"command", do:"install", of:"fzf"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

################################################################################
#                               Source & Export                                #
################################################################################

# Language
export LANG=en_US.UTF-8

# Set editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
   export VISUAL='vim'
 else
   export EDITOR='nvim'
   export VISUAL='nvim'
 fi

# ROS
if [ -f /opt/ros/indigo/setup.zsh ]; then
    . /opt/ros/indigo/setup.zsh
fi

if [ -f ~/catkin_ws/devel/setup.zsh ]; then
    . ~/catkin_ws/devel/setup.zsh
fi

if [ -f ~/pandora_ws/devel/setup.zsh ]; then
    . ~/pandora_ws/devel/setup.zsh --extend
fi

# Virtual Environments
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Virtual\ Environments
source /usr/local/bin/virtualenvwrapper.sh

# Torch
. /home/miltos/Libraries/torch/install/bin/torch-activate

################################################################################
#                                   Aliases                                    #
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
unalias lr
alias lR='ls -lhR'

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
alias gst'git status'

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

################################################################################
#                         Zsh History Substring Search                         #
################################################################################

# Ignore all duplicates from search
setopt HIST_IGNORE_ALL_DUPS

# Bind <Up, Down> keys for search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

################################################################################
#                                   Vi Mode                                    #
################################################################################

#bindkey -v

#bindkey -M vicmd 'k' history-substring-search-up
#bindkey -M vicmd 'j' history-substring-search-down
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
