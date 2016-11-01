#!/bin/bash

   . "$HOME/dotfiles/.utils/utils.sh" \
&& . "$HOME/dotfiles/.utils/symlinks.sh" \
&& . "$HOME/dotfiles/.utils/vim.sh"
printf "\n\n"

# Install oh-my-zsh
# https://github.com/robbyrussell/oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
printf "\n\n"


#cd "$(dirname "${BASH_SOURCE[0]}")" \
#        && . ".utils/utils.sh" \
#        && . ".utils/symlinks.sh" \
#        && . ".utils/vim.sh"
#printf "\n\n"
