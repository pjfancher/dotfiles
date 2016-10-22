#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
        && . ".utils/symlinks.sh" \
        && . ".bashrc" \
        && . ".utils/vim.sh"
printf "\n\n"
