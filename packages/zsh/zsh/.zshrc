################################################################################
# Zsh Configuration                                                            #
# -------------------------                                                    #
# 1. Tmux                                                                      #
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
# Tmux {{{1
################################################################################
# If not running interactively, do not do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux # Tmux >=3.1 searches at .config/tmux/tmux.conf
# [[ -z "$TMUX" ]] && exec tmux -f ${XDG_CONFIG_HOME:-${HOME}/.config}/tmux/tmux.conf
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
# zplug "Tarrasch/zsh-bd"
# zplug "b4b4r07/zsh-vimode-visual", use:"zsh-vimode-visual.sh", nice:19
zplug "soimort/translate-shell", at:"develop"
zplug "MichaelAquilina/zsh-you-should-use"
zplug "esc/conda-zsh-completion", use:"conda-zsh-completion.plugin.zsh"
# 2}}}
################################################################################

################################################################################
# Display {{{2
################################################################################
# zplug "mkofinas/zeta-sigma-zsh-theme"
# zplug "chriskempson/base16-shell", use:"scripts/base16-atelier-forest.sh"
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
# Fzf {{{2
################################################################################
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh
# 2}}}
################################################################################

################################################################################
# Desktop Scripts {{{2
################################################################################
if [ -f "${XDG_CONFIG_HOME:-${HOME}/.config}/desktop_scripts/config" ]; then
  . "${XDG_CONFIG_HOME:-${HOME}/.config}/desktop_scripts/config"
fi
# 2}}}
################################################################################

################################################################################
# Conda {{{2
################################################################################
if [[ -f "${HOME}/.local/lib/anaconda3/etc/profile.d/conda.sh" ]]; then
# source "${HOME}/.local/lib/anaconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
fi
# 2}}}
################################################################################

# 1}}}
################################################################################

################################################################################
# Aliases {{{1
################################################################################

# Common Aliases
source "${XDG_CONFIG_HOME:-${HOME}/.config}/common_aliases/aliases"

# Uncompress
alias x='unarchive'

# supercrabtree/k
alias k='k -h'
alias ka='k -A'
alias kl='k --no-vcs'

# A list of all the one-letter aliases
alias salias='alias | grep "^[a-z]=" | sort'

# Configuration Files
alias zsh_theme="${EDITOR} $ZPLUG_HOME/repos/mkofinas/zeta-sigma-zsh-theme/zeta_sigma.zsh-theme"

# Project Aliases
alias pmake='make -C ${PROJECT_ROOT}'
alias pag='ag -p ${PROJECT_ROOT}/.agignore'
alias plmk='latexmk -r ${PROJECT_ROOT}/.latexmkrc'
alias plrm='latexmk -r ${PROJECT_ROOT}/.latexmkrc -c'

alias sst='ssh -t'
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
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
# 2}}}
################################################################################

################################################################################
# Gitsome {{{2
################################################################################
autoload bashcompinit
bashcompinit
source ${XDG_CONFIG_HOME:-${HOME}/.config}/zsh/gh_complete.sh
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

################################################################################
# Direnv {{{2
################################################################################
eval "$(direnv hook zsh)"
# 2}}}
################################################################################

# 1}}}
################################################################################

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/mkofinas/.local/lib/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/mkofinas/.local/lib/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/home/mkofinas/.local/lib/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/home/mkofinas/.local/lib/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/mkofinas/.local/lib/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/home/mkofinas/.local/lib/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/mkofinas/.local/lib/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
    # eval "$__conda_setup"
# else
    # if [ -f "/home/mkofinas/.local/lib/anaconda3/etc/profile.d/conda.sh" ]; then
        # . "/home/mkofinas/.local/lib/anaconda3/etc/profile.d/conda.sh"
    # else
        # export PATH="/home/mkofinas/.local/lib/anaconda3/bin:$PATH"
    # fi
# fi
# unset __conda_setup

# if [ -f "/home/mkofinas/.local/lib/anaconda3/etc/profile.d/conda.sh" ]; then
    # . "/home/mkofinas/.local/lib/anaconda3/etc/profile.d/conda.sh"
# fi
# <<< conda initialize <<<

# disable init of env "base"
conda config --set auto_activate_base false

# vim:foldmethod=marker:foldlevel=0:foldenable
fpath+=${ZDOTDIR:-~}/.zsh_functions
