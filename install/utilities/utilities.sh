#!/bin/bash
###########################################
#      Install apt-get packages.          #
###########################################

# Ubuntu-only stuff. Abort if not Ubuntu.
is_ubuntu || return 1

ask_for_sudo
print_in_purple "\n   Utilities\n   ------------------------------\n"

# Define needed packages
packages=(
    build-essential
    npm
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
	bat
)

# Remove packages already installed from list
packages=($(setdiff "${packages[*]}" "$(dpkg --get-selections | grep -v deinstall | awk '{print $1}')"))

# If we still have packages that need to be installed
if (( ${#packages[@]} > 0 )); then

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

# Allow mosh connections
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-mosh-on-a-vps
sudo ufw allow 60000:61000/udp

print_success "Utilities Installed"
