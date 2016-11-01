#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
        && . ".utils/utils.sh" \
        && . ".utils/symlinks.sh" \
        && . ".bashrc" \
        && . ".utils/vim.sh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
printf "\n\n"
