#!/bin/bash
clear

# Load Utils
cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . ".utils/utils.sh" \
  && . ".utils/banner.sh" \
  && . ".utils/symlinks.sh" \
  && . ".utils/zsh.sh" \
  && . ".utils/vim.sh" \
  && cd $HOME

#Complete
print_in_purple "\n\n   Environment Setup Complete! Enjoy!\n"
