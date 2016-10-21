#!/bin/bash

# peej.io forwards to this file
# curl -L peej.io | bash

cd $HOME && git clone https://github.com/db-pj/dotfiles && cd dotfiles && chmod 755 install.sh && ./install.sh && cd $HOME && source .bashrc
