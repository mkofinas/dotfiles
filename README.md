# dotfiles
Configuration files for vim, git, zsh and other tools, stored in my home directory.

## Dependencies
Some configuration files rely on external modules in order to work
appropriately. For example, in order to use the suggested bash prompt,
[a set of support scripts](https://github.com/mkofinas/prompt-support)
and [a set of themes](https://github.com/mkofinas/bash-themes) have to be
downloaded. Additionally, in many cases, such as vim and bash prompt,
[nerd-fonts](https://github.com/ryanoasis/nerd-fonts) are used. The dependencies
mentioned above are either listed as submodules or downloaded automatically
using the install script explained below.

## Suggested usage
Clone the repo to your home directory and use the `install.sh` script in order to configure and install everything.
 Clone as `.dotfiles` if you want to make it hidden.

```sh
git clone https://github.com/mkofinas/dotfiles.git .dotfiles
cd .dotfiles
./install.sh
```

To actually use the configuration files, `install.sh` creates a backup of the
already existing dotfiles and then creates symbolic links to the right place.
 If your configuration differs take a look at the script and modify it accordingly.

## Adding new vim plugins
This repo uses [Vim-Plug](https://github.com/junegunn/vim-plug) as a plugin manager for vim.
 To manage plugins, simply add a vim-plug section to your `~/.vimrc` (or `~/.config/nvim/init.vim` for Neovim):

1. Begin the section with `plug#begin()`
1. List the plugins with `Plug` commands
1. `plug#end()` to update `&runtimepath` and initialize plugin system

For example, to install the (hypothetical) https://github.com/foo/bar plugin,
you can do the following:

```vim
call plug#begin()
Plug 'foo/bar'
call plug#end()
```

Then, reload your configuration file and run `:PlugInstall`. To update existing plugins run `:PlugUpdate`.

To install from command line: `nvim -c 'PlugInstall'`
