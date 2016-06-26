################################ Compress Files ################################

alias tar-gz='tar czf'
alias tar-bz2='tar cjf'

alias untar-gz='tar xzf'
alias untar-bz2='tar xjf'

################################ C/C++ Compiler ################################

alias compiler_gcc='export CC=gcc && export CXX=g++'
alias compiler_clang='export CC=clang && export CXX=clang++'

###################################### ROS #####################################

alias master_local='export ROS_MASTER_URI=http://localhost:11311'
alias master_test='export ROS_MASTER_URI=http://localhost:22422'

############################### PANDORA Robotics ###############################

alias master_robot='export ROS_MASTER_URI=http://192.168.0.106:11311'
alias master_lab='export ROS_MASTER_URI=http://pandora-lab:11311'

alias make_victim='cd ~/pandora_ws && catkin_make --only-pkg-with-deps pandora_vision_victim'
alias make_motion='cd ~/pandora_ws && catkin_make --only-pkg-with-deps pandora_vision_motion'

##################################### Linux ####################################

# List Directories
alias l='ls -1F'
alias ll='ls -lh'
alias la='ls -lhA'
alias lr='ls -lhR'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias file-grep='grep -hHIrFn'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias disk_status='df --human-readable'

# Make Directories
alias md='mkdir -p'

alias v="vim"
alias nv="nvim"
alias c="clear"
alias jl="julia"
alias ff="firefox"
alias o="xdg-open"
alias oo="xdg-open 2>/dev/null"

################################## Youtube-DL ##################################

alias dlmusic='youtube-dl --output "%(title)s.%(ext)s" -x --audio-format mp3'

#################################### IPython ###################################

alias ipy='ipython'
alias itorch="jupyter console --kernel=itorch --config=${XDG_CONFIG_HOME:-${HOME}/.config}/jupyter/itorch_console_config.py"
alias ith='itorch'
alias ijulia="jupyter console --kernel=julia-0.4 --config=${XDG_CONFIG_HOME:-${HOME}/.config}/jupyter/ijulia_console_config.py"
alias ijl='ijulia'
alias jn='jupyter notebook'

# Mutt - XDG Specification
alias mutt="sudo mutt -F ${XDG_CONFIG_HOME:-${HOME}/.config}/mutt/muttrc"

# Latexmk - XDG Specification
alias latexmk="latexmk -r ${XDG_CONFIG_HOME:-${HOME}/.config}/latex/.latexmkrc"

# Tmux - XDG Specification
alias tmux="tmux -f ${XDG_CONFIG_HOME:-${HOME}/.config}/tmux/tmux.conf"

# Vim - XDG Specification
alias vim="vim -u ${XDG_CONFIG_HOME:-${HOME}/.config}/vim/vimrc"

############################## Configuration Files #############################

alias bashrc="${EDITOR} ~/.bashrc"
alias sbash='source ~/.bashrc'
alias zshrc="$EDITOR ${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/.zshrc"
alias szsh="source ${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/.zshrc"

alias nvrc="${EDITOR} ${XDG_CONFIG_HOME:-${HOME}/.config}/nvim/init.vim"
alias vimrc="vim ${XDG_CONFIG_HOME:-${HOME}/.config}/vim/vimrc"

alias ipyrc="$EDITOR ${XDG_CONFIG_HOME:-${HOME}/.config}/ipython/profile_default/ipython_config.py"
alias tmrc="$EDITOR ${XDG_CONFIG_HOME:-${HOME}/.config}/tmux/tmux.conf"
alias muttrc="$EDITOR ${XDG_CONFIG_HOME:-${HOME}/.config}/mutt/muttrc"

alias bash_theme="${EDITOR} ~/.dotfiles/.bash/themes/${BASH_THEME}.theme.bash"

