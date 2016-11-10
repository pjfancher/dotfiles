#!/bin/bash
clear

# Load Utils
cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . ".utils/utils.sh"

# Banner
print_in_green " \
                          _     _       \n \
    ____   ___   ___     (_)   (_)____  \n \
   / __ \ / _ \ / _ \   / /   / // __ \ \n \
  / /_/ //  __//  __/  / /_  / // /_/ / \n \
 / ____/ \___/ \___/__/ /(_)/_/ \____/  \n \
/_/                /___/                \n \
"
 \

# Symlinks, Vim Plugins, Oh-My-Zsh
print_in_purple "\n\n   Setting Up Dev Environment... \n" \
   && . ".utils/symlinks.sh" \
   && . ".utils/zsh.sh" \
   && . ".utils/vim.sh" \
   && cd $HOME

#Complete
print_in_purple "\n\n   Environment Setup Complete! Enjoy!\n\n\n"
