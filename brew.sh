#!/usr/bin/env bash

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

echo "Updating and upgrading Homebrew..."; echo;
yes | brew update &> /dev/null
yes | brew upgrade &> /dev/null

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)


# Brew Utils
##############################################################################
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"
brew install moreutils
brew install findutils

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
