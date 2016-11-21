#!/bin/bash

# Ubuntu-only stuff. Abort if not Ubuntu.
is_ubuntu || return 1

ask_for_sudo

print_in_purple "\n   Apt-Get\n   ------------------------------\n"
packages=(
    python-software-properties
    software-properties-common
    php5 
    php5-gd 
    php5-mysql 
    php5-curl
    htop
    curl
    mosh
    dtrx
    ncdu
    tig
    phpmyadmin
)
packages=($(setdiff "${packages[*]}" "$(dpkg --get-selections | grep -v deinstall | awk '{print $1}')"))
#printf '%s\n' "${packages[@]}"


if (( ${#packages[@]} > 0 )); then
  for package in "${packages[@]}"; do
    execute "sudo apt-get -qq install $package -y >/dev/null 2>&1" "Installing $package"
  done
fi

print_success "All Packages Installed"
