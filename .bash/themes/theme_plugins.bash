source ~/.dotfiles/.bash/plugins/system/system.plugin.bash
source ~/.dotfiles/.bash/plugins/prompt/prompt.plugin.bash

source ~/.dotfiles/.terminal_support/colors/simple_colors.colors.bash

source ~/.dotfiles/.terminal_support/symbols/arrows.symbols.bash
source ~/.dotfiles/.terminal_support/symbols/letters.symbols.bash
source ~/.dotfiles/.terminal_support/symbols/box_drawing.symbols.bash
source ~/.dotfiles/.terminal_support/symbols/misc.symbols.bash

PROMPT_COMMAND="set_system_exit_status; $PROMPT_COMMAND"

