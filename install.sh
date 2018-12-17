#!/bin/bash

################################################################################
# Packages & Directories {{{1
################################################################################
declare -A dotfiles_packages
dotfiles_packages["vim"]=${XDG_CONFIG_HOME:-${HOME}/.config}
dotfiles_packages["tmux"]=${XDG_CONFIG_HOME:-${HOME}/.config}
dotfiles_packages["latex"]=${XDG_CONFIG_HOME:-${HOME}/.config}
dotfiles_packages["bash"]=${HOME}
dotfiles_packages["bash_support"]=${XDG_CONFIG_HOME:-${HOME}/.config}
dotfiles_packages["common_aliases"]=${XDG_CONFIG_HOME:-${HOME}/.config}
dotfiles_packages["git"]=${XDG_CONFIG_HOME:-${HOME}/.config}
dotfiles_packages["mutt"]=${XDG_CONFIG_HOME:-${HOME}/.config}
dotfiles_packages["zsh"]=${XDG_CONFIG_HOME:-${HOME}/.config}
dotfiles_packages["terminator"]=${XDG_CONFIG_HOME:-${HOME}/.config}
dotfiles_packages["neovim"]=${XDG_CONFIG_HOME:-${HOME}/.config}
dotfiles_packages["powerline"]=${XDG_CONFIG_HOME:-${HOME}/.config}
dotfiles_packages["readline"]=${XDG_CONFIG_HOME:-${HOME}/.config}
dotfiles_packages["jupyter"]=${XDG_CONFIG_HOME:-${HOME}/.config}
dotfiles_packages["ipython"]=${XDG_CONFIG_HOME:-${HOME}/.config}/ipython/profile_default
dotfiles_packages["cmus"]=${XDG_CONFIG_HOME:-${HOME}/.config}/cmus
dotfiles_packages["translate-shell"]=${XDG_CONFIG_HOME:-${HOME}/.config}
dotfiles_packages["direnv"]=${HOME}
dotfiles_packages["urlview"]=${HOME}
dotfiles_packages["ssh"]=${HOME}/.ssh
dotfiles_packages["user_dirs"]=${XDG_CONFIG_HOME:-${HOME}/.config}
# 1}}}
################################################################################

################################################################################
# Create Package Directories {{{1
################################################################################
mkdir -p "${XDG_CONFIG_HOME:-${HOME}/.config}/ipython/profile_default"
mkdir -p "${XDG_CONFIG_HOME:-${HOME}/.config}/cmus"
# 1}}}
################################################################################

################################################################################
# Backup Dotfiles {{{1
################################################################################
dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
dotfiles_backup_dir="${dotfiles_dir}.bak"

# Create backup directory to store the old dotfiles
echo "Create backup directory ${dotfiles_backup_dir}"
mkdir -p ${dotfiles_backup_dir}

echo "The following files will be backup-ed:"
for package in ${!dotfiles_packages[@]}; do
  for file in $(ls -1A ${dotfiles_dir}/packages/${package}); do
    full_file_name="${dotfiles_packages[$package]}/${file}"
    if [[ -e "$full_file_name" ]]; then
      echo "${full_file_name} -> ${dotfiles_backup_dir}/${file}"
      mv ${full_file_name} ${dotfiles_backup_dir}/${file}
    fi
  done
done
# 1}}}
################################################################################

################################################################################
# Gitconfig {{{1
################################################################################
cat "${dotfiles_dir}/.gitconfiglocal" >> "${dotfiles_dir}/.git/config"
# 1}}}
################################################################################

################################################################################
# GNU Stow {{{1
################################################################################
echo "Install GNU Stow"
if type "stow" > /dev/null; then
  echo "GNU Stow is already installed"
else
  sudo apt-get update && sudo apt-get install -y stow
fi
echo "Symlink dotfiles using GNU Stow:"
cd "${dotfiles_dir}/packages"
for package in ${!dotfiles_packages[@]}; do
  stow --verbose --restow --target=${dotfiles_packages[$package]} --ignore=.md ${package}
done
# 1}}}
################################################################################

################################################################################
# Nerd Fonts {{{1
################################################################################
# Download Desired Nerd Fonts
echo "Download Nerd Fonts"
fonts_dir="${XDG_DATA_HOME:-${HOME}/.local/share}/fonts"
mkdir -p "${fonts_dir}"

fonts_version="1.0.0"
affix="for%20Powerline%20"
# affix=
name_affix="for Powerline "
# name_affix=
fonts_repo="https://github.com/ryanoasis/nerd-fonts/raw/${fonts_version}/patched-fonts/"
curl -fLo "${fonts_dir}/DejaVu Sans Mono ${name_affix}Nerd Font Complete.ttf" \
  "${fonts_repo}/DejaVuSansMono/Regular/complete/DejaVa%20Sans%20Mono%20${affix}Nerd%20Font%20Complete.ttf"
curl -fLo "${fonts_dir}/DejaVu Sans Mono ${name_affix}Nerd Font Complete Mono.ttf" \
  "${fonts_repo}/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20${affix}Nerd%20Font%20Complete%20Mono.ttf"
curl -fLo "${fonts_dir}/Fura Mono ${name_affix}Regular Nerd Font Complete.otf" \
  "${fonts_repo}/FiraMono/Regular/complete/Fura%20Mono%20${affix}Regular%20Nerd%20Font%20Complete.otf"
curl -fLo "${fonts_dir}/Fura Mono ${name_affix}Regular Nerd Font Complete Mono.otf" \
  "${fonts_repo}/FiraMono/Regular/complete/Fura%20Mono%20${affix}Regular%20Nerd%20Font%20Complete%20Mono.otf"
curl -fLo "${fonts_dir}/Fura Code Regular Nerd Font Complete.otf" \
  "${fonts_repo}/FiraCode/Regular/complete/Fura%20Code%20Regular%20Nerd%20Font%20Complete.otf"
curl -fLo "${fonts_dir}/Fura Code Regular Nerd Font Complete Mono.otf" \
  "${fonts_repo}/FiraCode/Regular/complete/Fura%20Code%20Regular%20Nerd%20Font%20Complete%20Mono.otf"
echo "Done!"
# 1}}}
################################################################################

################################################################################
# Neovim Plugins {{{1
################################################################################
echo "Install Neovim Plugins"
nvim -c 'PlugInstall | qa'
# 1}}}
################################################################################

################################################################################
# Vim Plugins {{{1
################################################################################
# # Clone Vundle first
# VIM_CONFIG_HOME="${dotfiles_dir}/vim/.vim"
# git clone https://github.com/VundleVim/Vundle.vim.git ${VIM_CONFIG_HOME}/bundle/Vundle.vim

# # Install all plugins
# vim +PluginInstall +qall

# # Compile YouCompleteMe
# if [ -e ${VIM_CONFIG_HOME}/bundle/YouCompleteMe/install.py ]; then
#   echo "Compiling YouCompleteMe!"
#   ${VIM_CONFIG_HOME}/bundle/YouCompleteMe/install.py --clang-completer
# fi
# mkdir -p "${XDG_CACHE_HOME:-${HOME}/.cache}/vim"
# 1}}}
################################################################################

################################################################################
# Zsh - Prezto {{{1
################################################################################
zsh -c 'export ZDOTDIR="${XDG_CONFIG_HOME:-${HOME}/.config}/zsh"; ln -s "${ZDOTDIR}/.zprezto/bootstrap/zshenv" "${HOME}/.zshenv"; source "${ZDOTDIR}/.zshrc"'
# 1}}}
################################################################################

################################################################################
# Mutt {{{1
################################################################################
mkdir -p "${XDG_CACHE_HOME:-${HOME}/.cache}/mutt/headers"
mkdir -p "${XDG_DATA_HOME:-${HOME}/.local/share}/mutt/messages"
echo "WARNING! You have to set up your credentials in order for mutt to work!"
# 1}}}
################################################################################

################################################################################
# Tmux - Tmux Plugin Manager {{{1
################################################################################
git clone https://github.com/tmux-plugins/tpm ${XDG_CONFIG_HOME:-${HOME}/.config}/tmux/plugins/tpm
# 1}}}
################################################################################

################################################################################
# Create Directories {{{1
################################################################################
# rupa/z
mkdir -p "${XDG_DATA_HOME:-${HOME}/.local/share}/z"
# Less History
mkdir -p "${XDG_CACHE_HOME:-${HOME}/.cache}/less"
# 1}}}
################################################################################

################################################################################
# Neovim Python Hosts {{{1
################################################################################
mkvirtualenv neovim-python2 --python=python2
workon neovim-python2 && pip install neovim && deactivate
mkvirtualenv neovim-python3 --python=python3
workon neovim-python3 && pip install neovim && deactivate
# 1}}}
################################################################################

################################################################################
# Diff-so-fancy {{{1
################################################################################
mkdir -p Software/Repos
git clone git@github.com:so-fancy/diff-so-fancy.git ${HOME}/Software/Repos
# 1}}}
################################################################################

################################################################################
# Make Zsh the default shell {{{1
################################################################################
chsh -s /bin/zsh
# 1}}}
################################################################################


unset dotfiles_packages
echo "Installation completed successfully!"

# vim:foldmethod=marker:foldlevel=0:foldenable
