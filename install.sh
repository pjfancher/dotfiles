#!/bin/bash

# Symlinks & Vim Plugins
cd "$(dirname "${BASH_SOURCE[0]}")" \
   && . ".utils/utils.sh" \
   && . ".utils/symlinks.sh" \
   && . ".utils/vim.sh" \
   && cd $HOME
printf "\n\n"

# Install oh-my-zsh
# https://github.com/robbyrussell/oh-my-zsh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Use Custon .zshrc
mv $HOME/.zshrc.pre-oh-my-zsh $HOME/.zshrc \
&& source $HOME/.zshrc

TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
  if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
    # If this platform provides a "chsh" command (not Cygwin), do it, man!
    if hash chsh >/dev/null 2>&1; then
      printf "${BLUE}Time to change your default shell to zsh!${NORMAL}\n"
      chsh -s $(grep /zsh$ /etc/shells | tail -1)
    # Else, suggest the user do so manually.
    else
      printf "I can't change your shell automatically because this system does not have chsh.\n"
      printf "${BLUE}Please manually change your default shell to zsh!${NORMAL}\n"
    fi
  fi
