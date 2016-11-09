#!/bin/bash

# peej.io forwards to this file
# curl -L peej.io | bash

if [ -d ~/dotfiles ]; then
  rm -rf $HOME/dotfiles
fi

cd $HOME \
&& git clone --quiet https://github.com/db-pj/dotfiles &> /dev/null \
&& . $HOME/dotfiles/install.sh
