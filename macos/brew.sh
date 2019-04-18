#!/usr/bin/env bash

. "$HOME/dotfiles/install/utils.sh"
verify_osx

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Checks if Homebrew is installed
echo "Checking if Homebrew is already installed...";

if test ! $(which brew); then
  echo "Installing Homebrew...";
  yes | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
else
  echo "Homebrew is already installed...";
fi

echo "Setting Homebrew permissions...."
BREW_PREFIX=$(brew --prefix)
chown -R $USER $BREW_PREFIX/*

echo "Updating and upgrading Homebrew..."; echo;
yes | brew update &> /dev/null
yes | brew upgrade &> /dev/null


# Brew Utils
##############################################################################
brew install coreutils
brew install moreutils
brew install findutils

# Brew Apps
##############################################################################
brew install mosh
brew install tmux
brew install htop
brew install tig

# Casks
##############################################################################
brew tap caskroom/cask
brew tap caskroom/fonts

# Fonts
######################
brew cask install font-hack

# Apps
######################
brew cask install google-chrome
brew cask install firefox
brew cask install iterm2
brew cask install alfred
brew cask install dropbox
brew cask install itsycal
brew cask install divvy
brew cask install karabiner-elements

# Dev
######################
brew cask install virtualbox
brew cask install blisk
brew cask install postman
brew cask install screaming-frog-seo-spider

# Cleanup
######################
brew cleanup
