#!/bin/bash
# Generate .git-credentials file based on Environment Variables

# Get sudo upfront
#*****************************************************************************
sudo -v

# Required:
# $GIT_USER - git Username (ex: db-pj)
# $GIT_PASS - git Personal Access Token (https://github.com/settings/tokens)

# Source ~/dotfiles/.profile for local vars if it exists
#*****************************************************************************
PROFILE=~/dotfiles/.profile
if [ -f $PROFILE ]; then
  source $PROFILE
  printf "Found and sourced: ${PROFILE}\n"
fi

# Define Credential Store Method for Git
#*****************************************************************************
printf "Setting .git/config to cache credentials on disk at ~/.git-credentials\n\n"
git config credential.helper "store --file ~/.git-credentials"

#*****************************************************************************
# Check the needed ENV vars
#*****************************************************************************

# $GIT_USER
#*****************************************************************************
if [ -z "$GIT_USER" ]; then
  printf "\$GIT_USER NOT set.\nTry exporting \$GIT_USER as your github username in your ~/.{bash_}profile\n\n"
else
  printf "\$GIT_USER is set\n"
fi

# $GIT_PASS
#*****************************************************************************
if [ -z "$GIT_PASS" ]; then
  printf "\$GIT_PASS NOT set.\nTry exporting \$GIT_PASS to your github Personal Access Token in your ~/.{bash_}profile\nhttps://github.com/settings/tokens\n\n"
else
  printf "\$GIT_PASS is set\n"
fi

#*****************************************************************************
# Try to generate the ~/.git-credentials file
#*****************************************************************************
if [ -z "$GIT_USER" ] || [ -z "$GIT_PASS" ]; then
  printf "\nERROR: Could not generate ~/.git-credentials file\nCheck your \$GIT_USER and \$GIT_PASS Environment variables.\n\n";
  exit 1
else
  printf "https://${GIT_USER}:${GIT_PASS}@github.com" > ~/.git-credentials
  printf "Git Credentials stored in: ~/.git-credentials\n"
fi
