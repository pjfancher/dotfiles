#!/bin/bash
clear

# Load Scripts
cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . ".install/utils.sh" \
  && ask_for_sudo \
  && . ".install/banner.sh" \
  && . ".install/install-apt.sh" \
  && . ".install/symlinks.sh" \
  && . ".install/zsh.sh" \
  && . ".install/vim.sh" \
  && cd $HOME

#Complete
print_in_purple "\n\n   Environment Setup Complete! Enjoy!\n\n"
