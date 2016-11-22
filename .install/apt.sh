#!/bin/bash

# Ubuntu-only stuff. Abort if not Ubuntu.
is_ubuntu || return 1

print_in_purple "\n   Apt-Get\n   ------------------------------\n"

# Define needed packages
packages=(
    python-software-properties
    software-properties-common
    php5 
    php5-gd 
    php5-mysql 
    php5-curl
    php5-cli
    php5-cgi
    php5-dev
    vim
    htop
    curl
    mosh
    dtrx
    ncdu
    tig
    phpmyadmin
    build-essential
    sendmail
    libjpeg-progs
    gifsicle
    optipng
    imagemagick
)

# Remove packages already installed from list
packages=($(setdiff "${packages[*]}" "$(dpkg --get-selections | grep -v deinstall | awk '{print $1}')"))

# If we still have packages that need to be installed
if (( ${#packages[@]} > 0 )); then
  ask_for_sudo

  # Update Packages
  print_success "Updating Packages..."
  sudo apt-get -qq update > /dev/null 2>&1 && sudo apt-get upgrade -y > /dev/null 2>&1

  # Install each package
  for package in "${packages[@]}"; do
    print_success "Installing $package..."
    eval "sudo apt-get -qq install $package -y >/dev/null 2>&1"
  done
fi

print_success "All Packages Installed"
