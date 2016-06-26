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

# Virtual Environments
export PROJECT_HOME=$HOME/Virtual\ Environments

# CMUS - XDG Specification
export CMUS_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}/cmus"

# Less History
export LESSHISTFILE="${XDG_CACHE_HOME:-${HOME}/.cache}/less/history"

# Vim
# export VIMINIT='let $MYVIMRC="${XDG_CONFIG_HOME}/vim/vimrc" | source $MYVIMRC'

# IPython
export IPYTHONDIR="${XDG_CONFIG_HOME:-${HOME}/.config}/ipython"

# Jupyter
export JUPYTER_CONFIG_DIR="${XDG_CONFIG_HOME:-${HOME}/.config}/jupyter"

