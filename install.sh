#!/bin/bash

# Symlinks, Vim Plugins, Oh-My-Zsh
cd "$(dirname "${BASH_SOURCE[0]}")" \
   && . ".utils/utils.sh" \
   && . ".utils/symlinks.sh" \
   && . ".utils/zsh.sh" \
   && . ".utils/vim.sh" \
   && cd $HOME
printf "\n\n"
