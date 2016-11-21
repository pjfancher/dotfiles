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
packages=($(setdiff "${packages[*]}" "$(dpkg --get-selections | grep -v deinstall | awk '{print $1}')"))
#printf '%s\n' "${packages[@]}"


if (( ${#packages[@]} > 0 )); then
    execute "sudo apt-get -qq update >/dev/null 2>&1  && sudo apt-get -qq upgrade -y >/dev/null 2>&1" "Updating Packages"
  for package in "${packages[@]}"; do
    execute "sudo apt-get -qq install $package -y >/dev/null 2>&1" "Installing $package"
  done
fi

print_success "All Packages Installed"
