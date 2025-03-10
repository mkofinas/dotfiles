#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

export skip_global_compinit=1

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-${HOME}/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"

# Virtual Environments
# export PROJECT_HOME=$HOME/Software/Virtual\ Environments
# export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
# export VIRTUALENVWRAPPER_VIRTUALENV=$HOME/.local/bin/virtualenv
# source $HOME/.local/bin/virtualenvwrapper.sh
# if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  # source "${VIRTUAL_ENV}/bin/activate"
# fi

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

# Gimp
export GIMP2_DIRECTORY="${XDG_CONFIG_HOME:-${HOME}/.config}/gimp"

# Npm
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME:-${HOME}/.config}/npm/npmrc"
export PATH=$PATH:$HOME/.local/node-v14.16.0-linux-x64/bin

# Docker
export DOCKER_CONFIG="${XDG_CONFIG_HOME:-${HOME}/.config}/docker/config.json"

# Irb
export IRBRC="${XDG_CONFIG_HOME:-${HOME}/.config}/irb/irbrc"

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

# Diff so Fancy
export PATH=$PATH:$HOME/.local/diff-so-fancy

# TeX Live
export PATH=/usr/local/texlive/2024/bin/x86_64-linux:$PATH
export INFOPATH=$INFOPATH:/usr/local/texlive/2024/texmf-dist/doc/info
export MANPATH=$MANPATH:/usr/local/texlive/2024/texmf-dist/doc/man

# CUDA
export PATH=/usr/local/cuda-10.2/bin${PATH:+:${PATH}}
export PATH=/usr/local/cuda-9.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-10.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

export __GL_SHADER_DISK_CACHE_PATH="${XDG_CACHE_HOME:-${HOME}/.cache}/nv"
export CUDA_CACHE_PATH="${XDG_CACHE_HOME:-${HOME}/.cache}/nv"

# Tmux
export TMUX_TMPDIR=$XDG_RUNTIME_DIR
export PATH=$PATH:$HOME/.local/bin

# Pyenv
export PYENV_ROOT="${HOME}/.local/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# PyTorch
export TORCH_MODEL_ZOO="${XDG_CACHE_HOME:-${HOME}/.cache}/torch/checkpoints"

# Keras
export KERAS_HOME="${XDG_CACHE_HOME:-${HOME}/.cache}/keras"

# Wget
export WGETRC="${XDG_CONFIG_HOME:-${HOME}/.config}/wgetrc"

# Bat
export BAT_THEME="gruvbox-dark"

# Fzf
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --preview="bat --style=numbers --color=always {} | head -500"'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
