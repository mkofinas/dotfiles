#!/bin/bash
#
# Install Vim Plugins and create symlinks to the desired dotfiles.

dotfiles=$(pwd)
dotfiles_backup=$dotfiles".bak"
files=".vim .vimrc .inputrc .gitconfig .bash_aliases .bashrc .config/terminator/config .ipython/profile_default/ipython_config.py"

# Clone Vundle first
git clone https://github.com/VundleVim/Vundle.vim.git $dotfiles/.vim/bundle/Vundle.vim

# Install all plugins
vim +PluginInstall +qall

# Compile YouCompleteMe
if [ -e $dotfiles/.vim/bundle/YouCompleteMe/install.sh ]
then
  echo "Compiling YouCompleteMe!"
  cd $dotfiles/.vim/bundle/YouCompleteMe/
  ./install.py --clang-completer
fi

# Create backup directory to store the old dotfiles
mkdir -p $dotfiles_backup
echo "Created backup directory "$dotfiles_backup

# Create symbolic links
cd ~/
for file in $files; do
  if [ -e "$file" ]; then
    echo "Moving existing $file file to $dotfiles_backup"
    mv $file $dotfiles_backup/
  fi
  echo "Creating symlink to $file in home directory"
  ln -s $dotfiles/$file $file
done

# Return where we started
cd $dotfiles
echo "Installation completed!"
