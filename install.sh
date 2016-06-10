#!/bin/bash

################################################################################
# Packages & Directories {{{1
################################################################################
declare -A dotfiles_packages
dotfiles_packages["vim"]=${HOME}
dotfiles_packages["git"]=${HOME}
dotfiles_packages["tmux"]=${HOME}
dotfiles_packages["latex"]=${HOME}
dotfiles_packages["bash"]=${HOME}
dotfiles_packages["zsh"]=${ZDOTDIR:-${HOME}}
dotfiles_packages["terminator"]=${XDG_CONFIG_HOME:-${HOME}/.config}
dotfiles_packages["neovim"]=${XDG_CONFIG_HOME:-${HOME}/.config}
dotfiles_packages["powerline"]=${XDG_CONFIG_HOME:-${HOME}/.config}
dotfiles_packages["jupyter"]=${HOME}/.jupyter
dotfiles_packages["ipython"]=${HOME}/.ipython/profile_default
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
    if [[ -e "$full_file_name" && ! -L "${full_file_name}" ]]; then
      echo "${full_file_name} -> ${dotfiles_backup_dir}/${file}"
      mv ${full_file_name} ${dotfiles_backup_dir}/${file}
    fi
  done
done
# 1}}}
################################################################################

################################################################################
# GNU Stow {{{1
################################################################################
echo "Install GNU Stow"
sudo apt-get update && sudo apt-get install -y stow
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
# Download Desired Nerd Font
echo "Download Nerd Fonts"
mkdir -p ${XDG_DATA_HOME:-${HOME}/.local/share}/fonts
curl -fLo ${XDG_DATA_HOME:-${HOME}/.local/share}/fonts/"DejaVu Sans Mono for Powerline Nerd Font Complete.ttf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.ttf
echo "Done!"
# 1}}}
################################################################################

################################################################################
# Neovim Plugins {{{1
################################################################################
echo "Install Neovim Plugins"
nvim -c 'PlugInstall'
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
# 1}}}
################################################################################

echo "Installation completed successfully!"

# vim:foldmethod=marker:foldlevel=0:foldenable
