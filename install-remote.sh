#!/bin/bash

# peej.io forwards to this file
# curl -L peej.io | bash

git clone https://github.com/db-pj/dotfiles $HOME && . $HOME/dotfiles/install.sh
