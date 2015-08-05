# dotfiles
Configuration files for vim, git and other tools, stored in my home directory.

## Suggested usage
Clone the repo to your home directory and use the `install.sh` script in order to configure and install everything.
 Clone as `.dotfiles` if you want to make it hidden.

```
git clone https://github.com/mkofinas/dotfiles.git .dotfiles
cd .dotfiles
./install.sh
```

To actually use the configuration files, `install.sh` needs to create symbolic links to the right place.
 If your configuration differs take a look at the script and modify it accordingly.

## Adding new vim plugins
This repo uses [Vundle](https://github.com/VundleVim/Vundle.vim) as a plugin manager for vim.
 That means no more `git submodule` BS!
 Installing a new plugin requires no more than adding a single line in `.vimrc`.
 Let's say we want to add the (hypothetical) https://github.com/foo/bar plugin.
 This can be done by just adding the following in the beginning of our `.vimrc`:
```vim
Plugin 'foo/bar'
```

Then launch vim and run `:PluginInstall`. To update existing plugins run `:PluginUpdate`.

To install from command line: `vim +PluginInstall +qall`
