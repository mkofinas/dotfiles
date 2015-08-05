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

alias grep-in-files='grep -hHIrFn'

alias regvim='gvim --remote-silent'

alias cd..='cd ..'
alias cd..2='cd ../..'
alias cd..3='cd ../../..'
alias cd..4='cd ../../../..'

alias disk_st='df --human-readable '

############################## Configuration Files #############################

alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias sbashrc='source ~/.bashrc'

