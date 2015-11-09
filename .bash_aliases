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

# ls aliases
alias ll='ls -alhF'
alias la='ls -lAh'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias grep-in-files='grep -hHIrFn'

alias regvim='gvim --remote-silent'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias disk_status='df --human-readable '

alias o="gnome-open"
alias v="vim"
alias c="clear"

################################## Youtube-DL ##################################

alias dlmusic='youtube-dl --output "%(title)s.%(ext)s" -x --audio-format mp3'

#################################### IPython ###################################

alias ipy='ipython'

############################## Configuration Files #############################

alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias ipyrc='vim ~/.dotfiles/.ipython/profile_default/ipython_config.py'
alias sbash='source ~/.bashrc'
alias bash_theme="vim ~/.dotfiles/.bash/themes/${BASH_THEME}.theme.bash"

alias zshrc='vim ~/.zshrc'
alias szsh='source ~/.zshrc'
