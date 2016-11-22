#!/bin/bash

. "$HOME/dotfiles/.install/utils.sh"

# Ubuntu-only stuff. Abort if not Ubuntu.
is_ubuntu || return 1

print_in_purple "\n   NPM\n   ------------------------------\n"

# Define needed packages
packages=(
)
