#!/bin/bash

# Symlinks & Vim Plugins
cd "$(dirname "${BASH_SOURCE[0]}")" \
   && . ".utils/utils.sh" \
   && . ".utils/symlinks.sh" \
   && . ".utils/vim.sh" \
   && . ".utils/zsh.sh" \
   && cd $HOME
printf "\n\n"
