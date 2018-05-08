#!/bin/bash
clear
. "$HOME/dotfiles/install/utils.sh"

print_in_purple "\n   Installing Utilites \n" \
ask_for_sudo

# Load Scripts
cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "install/packages/utilities.sh" \
  && cd $HOME

#Complete
print_in_purple "\n\n   Utilities Installed! Enjoy!\n\n"
