#!/bin/bash
clear
. "$HOME/dotfiles/.install/utils.sh"

print_in_purple "\n   Installing Software \n" \
ask_for_sudo

# Load Scripts
cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . ".install/apt.sh" \
  && . ".install/npm.sh" \
  && cd $HOME

#Complete
print_in_purple "\n\n   Software Installed! Enjoy!\n\n"
