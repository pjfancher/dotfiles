#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cd "$(dirname "${BASH_SOURCE[0]}")" \
        && . ".utils/utils.sh" \
        && . ".utils/symlinks.sh" \
        && . ".bashrc" \
        && . ".utils/vim.sh"
printf "\n\n"
