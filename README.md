# dotfiles
Configuration files for vim, git and other tools, stored in my home directory.

## Adding new vim plugins
This repo uses [Vundle](https://github.com/gmarik/Vundle.vim) as a plugin manager for vim.
That means no more `git submodule` BS!
Find an interesting plugin and just install it, adding a single line in `.vimrc`.
Lets say we want to add (a hypothetical) https://github.com/foo/bar plugin, by just adding the following
in the beginning of our `.vimrc`:
```vim
Plugin 'foo/bar'
```

Then launch vim and run `:PluginInstall`. To update existing plugins run `:PluginUpdate`.

To install from command line: `vim +PluginInstall +qall`
