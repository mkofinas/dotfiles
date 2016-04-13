# Zsh Configuration

source $HOME/Repos/antigen/antigen.zsh
antigen use oh-my-zsh

antigen bundle pip
antigen bundle git
antigen bundle virtualenv
antigen bundle extract

antigen bundle rupa/z
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle supercrabtree/k
antigen bundle Tarrasch/zsh-bd
antigen bundle mkofinas/oh-my-zsh-git
#antigen bundle zsh-users/zsh-syntax-highlighting

#antigen bundle mafredri/zsh-async
#antigen bundle sindresorhus/pure

antigen theme mkofinas/zeta-sigma-zsh-theme zeta_sigma.zsh-theme

antigen apply

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

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
