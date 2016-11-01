#!/bin/bash

# Install oh-my-zsh
# https://github.com/robbyrussell/oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Symlinks & Vim Plugins
       . "$HOME/.utils/utils.sh" \
    && . "$HOME/.utils/symlinks.sh" \
    && . "$HOME/.utils/vim.sh"
printf "\n\n"
