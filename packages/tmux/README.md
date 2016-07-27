# Tmux

### Launch Terminator & Tmux

```sh
terminator -e "tmux  -f ${XDG_CONFIG_HOME:-${HOME}/.config}/tmux/tmux.conf"
```

If you want to make this the default terminal configuration, you can replace the
default `Ctrl+Alt+T` command with the above command.
