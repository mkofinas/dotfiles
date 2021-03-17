#!/bin/bash

################################################################################
# Packages & Directories {{{1
################################################################################
declare -A dotfiles_packages
dotfiles_packages["vim"]=${XDG_CONFIG_HOME:-${HOME}/.config}
dotfiles_packages["latex"]=${XDG_CONFIG_HOME:-${HOME}/.config}
dotfiles_packages["bash"]=${HOME}
dotfiles_packages["bash_support"]=${XDG_CONFIG_HOME:-${HOME}/.config}
dotfiles_packages["common_aliases"]=${XDG_CONFIG_HOME:-${HOME}/.config}
dotfiles_packages["git"]=${XDG_CONFIG_HOME:-${HOME}/.config}
dotfiles_packages["readline"]=${XDG_CONFIG_HOME:-${HOME}/.config}
dotfiles_packages["ipython"]=${XDG_CONFIG_HOME:-${HOME}/.config}/ipython/profile_default
dotfiles_packages["urlview"]=${HOME}
dotfiles_packages["ssh"]=${HOME}/.ssh
dotfiles_packages["wget"]=${XDG_CONFIG_HOME:-${HOME}/.config}
# 1}}}
################################################################################

################################################################################
# Create Package Directories {{{1
################################################################################
mkdir -p "${XDG_CONFIG_HOME:-${HOME}/.config}/ipython/profile_default"
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

fonts_version="2.1.0"
fonts_repo="https://github.com/ryanoasis/nerd-fonts/raw/${fonts_version}/patched-fonts/"
curl -fLo "${fonts_dir}/Fira Code Medium Nerd Font Complete.otf" \
  "${fonts_repo}/FiraCode/Medium/complete/Fira%20Code%20Medium%20Nerd%20Font%20Complete.otf"
curl -fLo "${fonts_dir}/Fira Code Bold Nerd Font Complete.otf" \
  "${fonts_repo}/FiraCode/Bold/complete/Fira%20Code%20Bold%20Nerd%20Font%20Complete.otf"
echo "Done!"
# 1}}}
################################################################################

###############################################################################
Vim Plugins {{{1
###############################################################################
# Clone Vundle first
VIM_CONFIG_HOME="${dotfiles_dir}/vim/.vim"
git clone https://github.com/VundleVim/Vundle.vim.git ${VIM_CONFIG_HOME}/bundle/Vundle.vim

# Install all plugins
vim +PluginInstall +qall

# Compile YouCompleteMe
if [ -e ${VIM_CONFIG_HOME}/bundle/YouCompleteMe/install.py ]; then
  echo "Compiling YouCompleteMe!"
  ${VIM_CONFIG_HOME}/bundle/YouCompleteMe/install.py
fi
mkdir -p "${XDG_CACHE_HOME:-${HOME}/.cache}/vim"
1}}}
###############################################################################

################################################################################
# Create Directories {{{1
################################################################################
# Less History
mkdir -p "${XDG_CACHE_HOME:-${HOME}/.cache}/less"
# 1}}}
################################################################################

################################################################################
# Diff-so-fancy {{{1
################################################################################
mkdir -p ${HOME}/.local
git clone git@github.com:so-fancy/diff-so-fancy.git ${HOME}/.local/diff-so-fancy
# 1}}}
################################################################################

unset dotfiles_packages
echo "Installation completed successfully!"

# vim:foldmethod=marker:foldlevel=0:foldenable
