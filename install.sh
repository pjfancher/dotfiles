#!/bin/bash

print_in_purple "\n\n   Setting Up Dev Environment...\n"

# Symlinks, Vim Plugins, Oh-My-Zsh
cd "$(dirname "${BASH_SOURCE[0]}")" \
   && . ".utils/utils.sh" \
   && . ".utils/symlinks.sh" \
   && . ".utils/zsh.sh" \
   && cd $HOME

print_in_purple "\n\n   Environment Setup Complete! Enjoy!\n"
