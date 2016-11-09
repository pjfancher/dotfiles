#!/bin/bash

# Symlinks & Vim Plugins
cd "$(dirname "${BASH_SOURCE[0]}")" \
   && . ".utils/utils.sh" \
   && . ".utils/symlinks.sh" \
   && . ".utils/zsh.sh" \
   && cd $HOME
printf "\n\n"

# Install oh-my-zsh
# https://github.com/robbyrussell/oh-my-zsh
# bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Use Custon .zshrc
#mv $HOME/.zshrc.pre-oh-my-zsh $HOME/.zshrc \
#&& source $HOME/.zshrc
