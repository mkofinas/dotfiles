################################ Compress Files ################################

alias tar-gz='tar cvzf'
alias tar-bz2='tar cvjf'

alias untar-gz='tar xvzf'
alias untar-bz2='tar xvjf'

##################################### Linux ####################################
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias disk_status='df --human-readable'

############################## Configuration Files #############################
alias bash_theme="${EDITOR} ~/.dotfiles/.bash/themes/${BASH_THEME}.theme.bash"

