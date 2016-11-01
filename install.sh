#!/bin/bash

# Install oh-my-zsh
# https://github.com/robbyrussell/oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Symlinks & Vim Plugins
cd "$(dirname "${BASH_SOURCE[0]}")" \
        && . ".utils/utils.sh" \
        && . ".utils/symlinks.sh" \
        && . ".utils/vim.sh"
printf "\n\n"
