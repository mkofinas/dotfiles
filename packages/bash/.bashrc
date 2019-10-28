# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
export HISTFILE="${XDG_DATA_HOME:-${HOME}/.local/share}/bash/history"
export INPUTRC="${XDG_CONFIG_HOME:-${HOME}/.config}/readline/inputrc"
if [[ $- == *i* ]]
then
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

################################################################################
# Environment Variables {{{1
################################################################################
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

export TERM=xterm-256color

export LESS='-i -M -R -S -w -z-4'

# Export XDG Specification Variables
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-${HOME}/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"

# CMUS - XDG Specification
export CMUS_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}/cmus"

# Less History
export LESSHISTFILE="${XDG_CACHE_HOME:-${HOME}/.cache}/less/history"

# Vim
# export VIMINIT=":source $XDG_CONFIG_HOME"/vim/vimrc

# IPython
export IPYTHONDIR="${XDG_CONFIG_HOME:-${HOME}/.config}/ipython"

# Jupyter
export JUPYTER_CONFIG_DIR="${XDG_CONFIG_HOME:-${HOME}/.config}/jupyter"

# rupa/z
export _Z_DATA="${XDG_DATA_HOME:-${HOME}/.local/share}/z/z"

# Pip
export PIP_LOG_FILE="${XDG_DATA_HOME:-${HOME}/.local/share}/pip/log"

# Npm
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME:-${HOME}/.config}/npm/npmrc"

# Golang
export GOPATH="${HOME}/Libraries/go"
export PATH=$PATH:/usr/local/go/bin:$HOME/Libraries/go/bin

# Rust
export RUSTUP_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/rustup"

# Cargo
export CARGO_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/cargo"
export PATH=$PATH:$CARGO_HOME/bin

# Python Pylint
export PYLINTHOME="${XDG_CACHE_HOME:-${HOME}/.cache}/pylint"

export PATH=$PATH:$HOME/Software/Repos/diff-so-fancy

# Virtual Environments
export PROJECT_HOME=$HOME/Software/Virtual\ Environments
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=$HOME/.local/bin/virtualenv
source $HOME/.local/bin/virtualenvwrapper.sh

export PATH=/usr/local/texlive/2018/bin/x86_64-linux:$PATH
export INFOPATH=$INFOPATH:/usr/local/texlive/2018/texmf-dist/doc/info
export MANPATH=$MANPATH:/usr/local/texlive/2018/texmf-dist/doc/man

# CUDA
export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}
export PATH=/usr/local/cuda-9.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

export CUDA_CACHE_PATH="${XDG_CACHE_HOME:-${HOME}/.cache}/nv"

# Tmux
export TMUX_TMPDIR=$XDG_RUNTIME_DIR

# Pyenv
export PYENV_ROOT="${HOME}/Software/Libraries/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# PyTorch
export TORCH_MODEL_ZOO="${XDG_CACHE_HOME:-${HOME}/.cache}/torch/checkpoints"

# Keras
export KERAS_HOME="${XDG_CACHE_HOME:-${HOME}/.cache}/keras"

# Wget
export WGETRC="${XDG_CONFIG_HOME:-${HOME}/.config}/wgetrc"
# 1}}}
################################################################################

################################################################################
# ROS {{{1
################################################################################
if [ -f /opt/ros/indigo/setup.bash ]; then
    . /opt/ros/indigo/setup.bash
fi

if [ -f ~/catkin_ws/devel/setup.bash ]; then
    . ~/catkin_ws/devel/setup.bash
fi

if [ -f ~/pandora_ws/devel/setup.bash ]; then
    . ~/pandora_ws/devel/setup.bash --extend
fi
# 1}}}
################################################################################

################################################################################
# Theme {{{1
################################################################################
BASH_THEME="basic"

if [ -f ${XDG_CONFIG_HOME:-${HOME}/.config}/bash/bash-themes/${BASH_THEME}.theme.bash ]; then
    . ${XDG_CONFIG_HOME:-${HOME}/.config}/bash/bash-themes/${BASH_THEME}.theme.bash
fi
# 1}}}
################################################################################

################################################################################
# Aliases {{{1
################################################################################
if [ -f ${XDG_CONFIG_HOME:-${HOME}/.config}/bash/bash_aliases ]; then
    . ${XDG_CONFIG_HOME:-${HOME}/.config}/bash/bash_aliases
fi

source "${XDG_CONFIG_HOME:-${HOME}/.config}/common_aliases/aliases"
# 1}}}
################################################################################

################################################################################
# Fzf {{{1
################################################################################
if [ -f "${XDG_CONFIG_HOME:-${HOME}/.config}/fzf/fzf.bash" ]; then
  source "${XDG_CONFIG_HOME:-${HOME}/.config}/fzf/fzf.bash"
fi
# 1}}}
################################################################################

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# vim:foldmethod=marker:foldlevel=0:foldenable
