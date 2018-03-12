#!/bin/bash

#############################################################
# peej.io forwards to this file
# curl -L peej.io | bash
#############################################################

# Check for git
#############################################################
hash git >/dev/null 2>&1 || {
  echo "Error: git is not installed. Trying to install..."
  sudo apt-get install git
}

# Check for zsh
#############################################################
hash zsh >/dev/null 2>&1 || {
  echo "Error: zsh is not installed. Trying to install..."
  sudo apt-get install zsh
}

# Delete current dotfiles dir if there is one
#############################################################
if [ -d ~/dotfiles ]; then
  rm -rf $HOME/dotfiles
fi

# Clone the repo and run the install script
#############################################################
cd $HOME \
&& git clone --quiet --recursive https://github.com/pjfancher/dotfiles &> /dev/null \
&& . $HOME/dotfiles/install.sh
