# Path to your oh-my-zsh installation.
export ZSH=/home/miltos/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="two_lines"
# ZSH_THEME="pure"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(pip git zsh-syntax-highlighting oh-my-git virtualenv extract)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

################################ C/C++ Compiler ################################

alias compiler_gcc='export CC=gcc && export CXX=g++'
alias compiler_clang='export CC=clang && export CXX=clang++'

###################################### ROS #####################################

alias master_local='export ROS_MASTER_URI=http://localhost:11311'
alias master_test='export ROS_MASTER_URI=http://localhost:22422'

############################### PANDORA Robotics ###############################

alias master_robot='export ROS_MASTER_URI=http://192.168.0.106:11311'
alias master_lab='export ROS_MASTER_URI=http://pandora-lab:11311'

alias make_victim='cd ~/pandora_ws && catkin_make --only-pkg-with-deps pandora_vision_victim'
alias make_motion='cd ~/pandora_ws && catkin_make --only-pkg-with-deps pandora_vision_motion'

################################### Shortcuts ##################################

alias l='ls -CF'
alias ll='ls -lahF'
alias la='ls -A'

alias v="vim"
alias nv="nvim"
alias o="gnome-open"
alias c="clear"
alias jl="julia"
alias ff="firefox"

alias file-grep='grep -hHIrn'

alias disk_status='df --human-readable'

# A list of all the one-letter aliases
alias salias='alias | grep "^[a-z]=" | sort'

############################### IPython - Jupyter ##############################

alias ipy='ipython'
alias itorch='jupyter console --kernel=itorch --config=~/.jupyter/itorch_console_config.py'
alias ith='itorch'
alias ijulia='jupyter console --kernel=julia-0.4 --config=~/.jupyter/ijulia_console_config.py'
alias ijl='ijulia'
alias jn='jupyter notebook'

############################## Configuration Files #############################

alias zshrc="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias szsh="source ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias nvrc="$EDITOR ~/.config/nvim/init.vim"
alias bashrc="$EDITOR ~/.bashrc"
alias sbash="source ~/.bashrc"
alias ipyrc="$EDITOR ~/.ipython/profile_default/ipython_config.py"
alias zsh_theme="$EDITOR $ZSH_CUSTOM/themes/$ZSH_THEME.zsh-theme"

###################################### ROS #####################################

if [ -f /opt/ros/indigo/setup.zsh ]; then
    . /opt/ros/indigo/setup.zsh
fi

if [ -f ~/catkin_ws/devel/setup.zsh ]; then
    . ~/catkin_ws/devel/setup.zsh
fi

if [ -f ~/pandora_ws/devel/setup.zsh ]; then
    . ~/pandora_ws/devel/setup.zsh --extend
fi

############################# Virtual Environments #############################

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Virtual\ Environments
source /usr/local/bin/virtualenvwrapper.sh

##################################### Torch ####################################

. /home/miltos/Libraries/torch/install/bin/torch-activate

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

BASE16_SHELL="$HOME/.config/base16-shell/base16-atelierforest.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

. $ZSH/custom/plugins/z/z.sh
source $ZSH/custom/plugins/k/k.sh
# zsh-bd
. $HOME/Repos/zsh-bd/bd.zsh
