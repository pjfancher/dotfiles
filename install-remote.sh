#!/bin/bash

# peej.io forwards to this file
# curl -L peej.io | bash

cd $HOME \
&& git clone https://github.com/db-pj/dotfiles \
&& . $HOME/dotfiles/install.sh \
&& mv $HOME/.zshrc.pre-oh-my-zsh $HOME/.zshrc \
&& source $HOME/.zshrc
