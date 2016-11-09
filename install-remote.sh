#!/bin/bash

# peej.io forwards to this file
# curl -L peej.io | bash

if [ -d $HOME/dotfiles ]; then
  rm -rf $HOME/dotfiles
fi

cd $HOME \
&& git clone https://github.com/db-pj/dotfiles \
&& . $HOME/dotfiles/install.sh
