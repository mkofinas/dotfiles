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

# Virtual Environments
export PROJECT_HOME=$HOME/Virtual\ Environments

# CMUS - XDG Specification
export CMUS_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}/cmus"

# Less History
export LESSHISTFILE="${XDG_CACHE_HOME:-${HOME}/.cache}/less/history"

