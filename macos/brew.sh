#!/usr/bin/env bash

. "$HOME/dotfiles/install/utils.sh"
verify_osx

osascript -e 'display notification "Installing Homebrew Packages" with title "Homebrew"'

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
#:echown -R $USER $BREW_PREFIX/*

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
brew install cmake
brew install python
brew install npm
brew install vim
brew install mosh
brew install wget
brew install tmux
brew install htop
brew install bat
brew install tig
brew install ag
brew install ncdu
brew install dtrx
brew install direnv

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
brew cask install vlc
brew cask install itsycal
brew cask install karabiner-elements
brew cask install rectangle
brew cask install 1password
brew cask install cyberduck
brew cask install cursor


# Dev
######################

brew cask install postman
brew cask install visual-studio-code
brew cask install screaming-frog-seo-spider

# Cleanup
######################
brew cleanup
