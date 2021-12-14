#!/bin/bash
###########################################
#      Install apt-get packages.          #
###########################################

# Ubuntu-only stuff. Abort if not Ubuntu.
is_ubuntu || return 1

ask_for_sudo
print_in_purple "\n   Apt-Get\n   ------------------------------\n"

# USERS
#*****************************************************************************
USERS=('pj')
GROUPS=('sudo' 'www-data')

# Define needed packages
#*****************************************************************************
TOOLS=(
    'git'
    'mosh'
    'zsh'
    'tmux'
    'curl'
    'vim'
    'build-essential'
    'mosh'
    'npm'
    'certbot'
    'python3-certbot-dns-cloudflare'

    # Helpful tools; not required
    'dtrx'
    'ncdu'
    'tig'
    'htop'
    'trash-cli'
    'ack-grep'
    'silversearcher-ag'
    'finger'
    'bat'
)

# Tools that may be pre-installed that we'd like to remove
#*****************************************************************************
REMOVE_TOOLS=(
	'snapd'
	'apache'
	'mysql'
)

# Install Tools
#*****************************************************************************
sudo apt update
for TOOL in "${TOOLS[@]}"; do
	sudo apt install ${TOOL} -y
done

# Remove some tools that may be pre-installed
#*****************************************************************************
for TOOL in "${REMOVE_TOOLS[@]}"; do
	sudo systemctl mask ${TOOL}.service
done


# Add Users and assign Groups
#*****************************************************************************
for USER in "${USERS[@]}"; do
	sudo useradd -m $USER

	# Add users to groups
	for GROUP in "${GROUPS[@]}"; do
		sudo usermod -a -G $GROUP $USER
	done
done

print_success "Apt-Get Packages Installed"
