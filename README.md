# dotfiles
Configuration files for Vim/NeoVim, Git, Bash/Zsh, IPython etc.

Tested on Ubuntu 14.04 LTS and managed using GNU Stow.

## Summary
This repository contains configuration files for the following:
- Vim
  - Configuration & Plugins managed by [Vundle](https://github.com/VundleVim/Vundle.vim)
  - Rarely updated due to transition to [Neovim](https://github.com/neovim/neovim)
- Neovim
  - Configuration & Plugins managed by [VimPlug](https://github.com/junegunn/vim-plug)
- Bash
  - Custom Themes, Aliases & Helper Functions
  - Rarely updated due to transition to Zsh
- Zsh
  - Main configuration by [Prezto](https://github.com/sorin-ionescu/prezto)
  - Plugins Managed by [ZPlug](https://github.com/zplug/zplug)
- IPython & Jupyter Console
  - IPython/Jupyter Console
  - IJulia
  - ITorch
- CMUS (C\* Music Player)
- Mutt (Mail Client)
- Git
- Terminator
- Tmux
- Latexmk
- Powerline

## Dependencies
Some configuration files rely on external modules in order to work
appropriately. For example, in order to use the suggested bash prompt,
[a set of support scripts](https://github.com/mkofinas/prompt-support)
and [a set of themes](https://github.com/mkofinas/bash-themes) have to be
downloaded.

Additionally, in many cases, such as vim and bash prompt,
[nerd-fonts](https://github.com/ryanoasis/nerd-fonts) are used. The dependencies
mentioned above are either listed as submodules or downloaded automatically
using the install script explained below.

## Installation

### One-Liner (Experimental)
```sh
curl -L https://raw.githubusercontent.com/mkofinas/dotfiles/master/dowload_install.sh | bash
```

### Manual Installation
Clone the repo to a directory of your choice and use the `install.sh` script in
order to configure and install everything.
 Clone as `.dotfiles` if you want to make it hidden.

```sh
git clone --recursive https://github.com/mkofinas/dotfiles.git dotfiles
cd dotfiles
./install.sh
```

To actually use the configuration files, `install.sh` creates a backup of the
already existing dotfiles and then creates symbolic links to the right place
using GNU Stow.

The installation script defines the packages to be installed using declarative
arrays (i.e. dictionaries) as follows:

```sh
declare -A dotfiles_packages
# ...
dotfiles_packages["neovim"]=${XDG_CONFIG_HOME:-${HOME}/.config}
# ...
```

You might want to take a look at the packages to be installed and modify the
installation script according to your needs, by simply commenting out or adding
packages.

## Adding new Neovim plugins
This repo uses [Vim-Plug](https://github.com/junegunn/vim-plug) as a plugin
manager for Neovim.

To manage plugins, simply add a vim-plug section to your `~/.config/nvim/init.vim`:

1. Begin the section with `plug#begin()`
1. List the plugins with `Plug` commands
1. `plug#end()` to update `&runtimepath` and initialize plugin system

Then, reload your configuration file and run `:PlugInstall`. To update existing
plugins run `:PlugUpdate`.

To install from command line: `nvim -c 'PlugInstall'`

For more information, visit the [Vim-Plug example](https://github.com/junegunn/vim-plug#example).

## TODO - Issues

- [ ] DejaVu Nerd Font bold characters seem somewhat blurry.
- [ ] Installation script seems to have issues overwriting current dotfiles.
- [ ] Add [XDG Specifications Compliance](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) when applicable.
  - [x] Vim
  - [x] Neovim
  - [ ] Bash
  - [x] Readline
  - [x] Zsh
  - [x] IPython
  - [x] Jupyter
  - [x] CMUS
  - [x] Mutt
  - [x] Git
  - [x] Terminator
  - [x] Tmux
  - [x] Latexmk
  - [x] Powerline

Resources:

- https://wiki.archlinux.org/index.php/XDG_Base_Directory_support
