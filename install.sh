#!/bin/bash

# Symlinks, Vim Plugins, Oh-My-Zsh
cd "$(dirname "${BASH_SOURCE[0]}")" \
   && . ".utils/utils.sh" \
   && print_in_purple "\n\n   Setting Up Dev Environment... \n" \
   && . ".utils/symlinks.sh" \
   && . ".utils/zsh.sh" \
   && cd $HOME

print_in_green "\n\n \
  ██████╗ ███████╗███████╗     ██╗   ██╗ ██████╗ \
  ██╔══██╗██╔════╝██╔════╝     ██║   ██║██╔═══██╗\
  ██████╔╝█████╗  █████╗       ██║   ██║██║   ██║\
  ██╔═══╝ ██╔══╝  ██╔══╝  ██   ██║   ██║██║   ██║\
  ██║     ███████╗███████╗╚█████╔╝██╗██║╚██████╔╝\
  ╚═╝     ╚══════╝╚══════╝ ╚════╝ ╚═╝╚═╝ ╚═════╝ \
  "
print_in_purple "\n\n   Environment Setup Complete! Enjoy!\n\n"
