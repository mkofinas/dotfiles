# dotfiles
Personal configuration files. Tested on Ubuntu 14.04 LTS and managed using GNU Stow.

## Summary
This repository contains configuration files for the following:
- [Vim][15]
  - Configuration & Plugins managed by [Vundle][4]
  - Rarely updated due to transition to [Neovim][1]
- [Neovim][1]
  - Configuration & Plugins managed by [VimPlug][3]
- [Bash][17]
  - Custom Themes, Aliases & Helper Functions
  - Rarely updated due to transition to Zsh
- [Zsh][18]
  - Main configuration by [Prezto][5]
  - Plugins Managed by [ZPlug][6]
- [IPython][19]
- [Jupyter][20]
  - [Jupyter Console][21]
  - [IJulia][23]
  - [ITorch][22]
- [CMUS][7] (Music Player)
- [Mutt][24] (Mail Client)
- [Git][25]
- [Terminator][26]
- [Tmux][27]
- [Latexmk][28]
- [Powerline][29]

## Dependencies
Some configuration files rely on external modules in order to work
appropriately. For example, in order to use the suggested bash prompt,
[a set of support scripts][9] and [a set of themes][10] have to be downloaded.

Additionally, in many cases, such as vim and bash prompt, [nerd-fonts][11] are
used. The dependencies mentioned above are either listed as submodules or
downloaded automatically using the install script explained below.

## Installation

### One-Liner (Experimental)

Clone with HTTPS:

```sh
curl -L https://raw.githubusercontent.com/mkofinas/dotfiles/master/dowload_install.sh | bash
```

Or, if you prefer, clone with SSH:

```sh
curl -L https://raw.githubusercontent.com/mkofinas/dotfiles/master/dowload_install.sh | bash /dev/stdin -s
```

You can also specify the directory you wish to install the dotfiles (e.g. `.dotfiles`):

```sh
curl -L https://raw.githubusercontent.com/mkofinas/dotfiles/master/dowload_install.sh | bash /dev/stdin -s .dotfiles
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

## Implementation Details

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

### XDG Base Directory Specification
Whenever possible, I try to follow the [XDG Base Directory Specification][12]
to organize my dotfiles, in order to avoid the pollution of my entire HOME
directory. Towards the organization of software following XDG specification, I
recommend taking a look at the [Arch Linux wiki][13].

## Adding new Neovim plugins
This repo uses [Vim-Plug][3] as a plugin manager for Neovim.

To manage plugins, simply add a vim-plug section to your `~/.config/nvim/init.vim`:

1. Begin the section with `plug#begin()`
1. List the plugins with `Plug` commands
1. `plug#end()` to update `&runtimepath` and initialize plugin system

Then, reload your configuration file and run `:PlugInstall`. To update existing
plugins run `:PlugUpdate`.

To install from command line: `nvim -c 'PlugInstall'`

For more information, visit the [Vim-Plug example][14].

## TODO - Issues

- [ ] DejaVu Nerd Font bold characters (pt. 10) seem somewhat pudgy.
  - The problem seems to (for the most part) disappear when using a font size of
    12 of higher.
- [ ] Installation script seems to have issues overwriting current dotfiles.
- [x] Add [XDG Specifications Compliance][12] when applicable.
  - [x] Vim
  - [x] Neovim
  - [x] Bash (Only `.bashrc` and `.bash_profile` in HOME Directory)
  - [x] Readline
  - [x] Zsh (Only `.zshenv` in HOME Directory)
  - [x] IPython
  - [x] Jupyter
  - [x] CMUS
  - [x] Mutt
  - [x] Git
  - [x] Terminator
  - [x] Tmux
  - [x] Latexmk
  - [x] Powerline

[1]: https://neovim.io/
[2]: https://github.com/neovim/neovim
[3]: https://github.com/junegunn/vim-plug
[4]: https://github.com/VundleVim/Vundle.vim
[5]: https://github.com/sorin-ionescu/prezto
[6]: https://github.com/zplug/zplug
[7]: https://cmus.github.io/
[8]: https://github.com/cmus/cmus
[9]: https://github.com/mkofinas/prompt-support
[10]: https://github.com/mkofinas/bash-themes
[11]: https://github.com/ryanoasis/nerd-fonts
[12]: https://specifications.freedesktop.org/basedir-spec/latest/
[13]: https://wiki.archlinux.org/index.php/XDG_Base_Directory_support
[14]: https://github.com/junegunn/vim-plug#example
[15]: http://www.vim.org/
[16]: https://github.com/vim/vim
[17]: https://www.gnu.org/software/bash/
[18]: http://www.zsh.org/
[19]: https://ipython.org/
[20]: http://jupyter.org/
[21]: https://github.com/jupyter/jupyter_console
[22]: https://github.com/facebook/iTorch
[23]: https://github.com/JuliaLang/IJulia.jl
[24]: http://www.mutt.org/
[25]: https://git-scm.com/
[26]: http://gnometerminator.blogspot.gr/p/introduction.html
[27]: http://tmux.github.io/
[28]: http://users.phys.psu.edu/~collins/software/latexmk-jcc/
[29]: https://powerline.readthedocs.io/en/latest/
