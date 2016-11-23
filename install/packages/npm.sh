#!/bin/bash

. "$HOME/dotfiles/install/utils.sh"

# Ubuntu-only stuff. Abort if not Ubuntu.
is_ubuntu || return 1

print_in_purple "\n   NPM\n   ------------------------------\n"

# Install NVM
curl -s https://raw.githubusercontent.com/creationix/nvm/v0.16.1/install.sh | sh > /dev/null 2>&1
print_success "NVM Installed"

# Install Node
nvm install node &> /dev/null 
nvm use node &> /dev/null
nvm alias default node &> /dev/null
npm install -g --silent node-gyp &> /dev/null

print_success "Node Installed"

# Define needed packages
packages=(
  node-gyp
  less@1.3.3
  uglify-js
)

# Install each package
for package in "${packages[@]}"; do
  print_success "Installing $package..."
  eval "sudo npm install -g --silent $package &> /dev/null"
done
