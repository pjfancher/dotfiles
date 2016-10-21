#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
        && . "../utils.sh"

./.bashrc
./.utils/symlinks.sh
./.utils/vim.sh
