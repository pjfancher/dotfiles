#!/bin/bash
clear
. "$HOME/dotfiles/install/utils.sh"

print_in_purple "\n   Installing Packages \n" \
ask_for_sudo

# Load Scripts
cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "install/packages/lamp" \
  && . "install/packages/pip.sh" \
  && . "install/packages/npm.sh" \
  && cd $HOME

#Complete
print_in_purple "\n\n   Packages Installed! Enjoy!\n\n"
