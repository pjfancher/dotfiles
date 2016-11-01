#!/bin/bash

# Install oh-my-zsh
# https://github.com/robbyrussell/oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Symlinks & Vim Plugins
       . "$HOME/dotfiles/.utils/utils.sh" \
    && . "$HOME/dotfiles/.utils/symlinks.sh" \
    && . "$HOME/dotfiles/.utils/vim.sh"
printf "\n\n"
