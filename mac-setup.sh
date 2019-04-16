#!/bin/bash
. "$HOME/dotfiles/install/utils.sh"
verify_osx

clear

. "$HOME/dotfiles/install/banner.sh" \
"\n\nSetting Up Mac OS X\n\n"

# Load Scripts
cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "macos/macos.sh" \
  && . "macos/brew.sh" \
  && cd $HOME

#Complete
print_in_purple "\n\nMac OS X Setup Complete! Enjoy!\n\n"
