#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
        && . ".utils/utils.sh"

"./.utils/symlinks.sh"
"./.bashrc"
"./.utils/vim.sh"
