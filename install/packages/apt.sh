#!/bin/bash
###########################################
#      Install apt-get packages.          #
###########################################

# Ubuntu-only stuff. Abort if not Ubuntu.
is_ubuntu || return 1

ask_for_sudo
print_in_purple "\n   Apt-Get\n   ------------------------------\n"

# Define needed packages
packages=(
    python-software-properties
    software-properties-common
    python-pip
    python-dev
    php5 
    php5-gd 
    php5-mysql 
    php5-curl
    php5-cli
    php5-cgi
    php5-dev
    phpmyadmin
    build-essential
    npm
    #letsencrypt
    #apt-transport-https
    #ca-certificates
    sendmail
    libjpeg-progs
    gifsicle
    optipng
    imagemagick
    finger
    vim-nox
    ctags
    tmux
    htop
    curl
    mosh
    dtrx
    ncdu
    tig
    ack-grep
    silversearcher-ag
)

# Remove packages already installed from list
packages=($(setdiff "${packages[*]}" "$(dpkg --get-selections | grep -v deinstall | awk '{print $1}')"))

# If we still have packages that need to be installed
if (( ${#packages[@]} > 0 )); then

  # Add PPAs
  sudo add-apt-repository -y ppa:gekkio/ag > /dev/null 2>&1
  sudo add-apt-repository -y ppa:pi-rho/dev > /dev/null 2>&1
  
  # Update Packages
  print_success "Updating Packages..."
  sudo apt-get -qq update > /dev/null 2>&1

  # Install each package
  for package in "${packages[@]}"; do
    print_success "Installing $package..."
    eval "sudo apt-get -qq install $package -y"
  done

  # Upgrade Packages
  print_success "Upgrading Packages..."
  sudo apt-get upgrade -y > /dev/null 2>&1
fi

print_success "Apt-Get Packages Installed"
