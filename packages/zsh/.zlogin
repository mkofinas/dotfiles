#
# Executes commands at login post-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Execute code that does not affect the current session in the background.
{
  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!

# Print a random, hopefully interesting, adage.
if (( $+commands[python] )); then
  # if (( $+commands[fortune] && $+commands[cowsay] )); then
  if [[ -t 0 || -t 1 ]]; then
    # fortune -s | cowsay -f moose
    # print
    # bash ${HOME}/My-Repos/random-quotes/print_random_quote.sh
    python ${HOME}/My-Repos/random-quotes/print_random_quote.py
  fi
fi
