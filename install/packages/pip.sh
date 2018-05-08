#!/bin/bash
###########################################
#      Install apt-get packages.          #
###########################################

# Ubuntu-only stuff. Abort if not Ubuntu.
is_ubuntu || return 1

ask_for_sudo
print_in_purple "\n   Python Packages\n   ------------------------------\n"

#Install tmuxp
sudo pip install tmuxp

print_success "Python Packages Installed"
