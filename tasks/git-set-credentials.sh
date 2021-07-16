#!/bin/bash
# Generate .git-credentials file based on Environment Variables

# Required:
# $GIT_USER - git Username (ex: db-pj)
# $GIT_PASS - git Personal Access Token (https://github.com/settings/tokens)
#*****************************************************************************

# Get sudo upfront
#*****************************************************************************
sudo -v

# Vars
#*****************************************************************************
GC=~/.git-credentials
ERROR=false

# Source ~/dotfiles/.profile for local vars if it exists
#*****************************************************************************
PROFILE=~/dotfiles/.profile
if [ -f $PROFILE ]; then
  source $PROFILE
  printf "Found and sourced: ${PROFILE}\n"
fi

#*****************************************************************************
# Check the needed ENV vars
#*****************************************************************************

# $GIT_USER
#*****************************************************************************
if [ -z "$GIT_USER" ]; then
  printf "\$GIT_USER NOT set.\nTry exporting \$GIT_USER as your github username in your ~/.{bash_}profile\n\n"
  ERROR=true
else
  printf "\$GIT_USER is set\n"
fi

# $GIT_PASS
#*****************************************************************************
if [ -z "$GIT_PASS" ]; then
  printf "\$GIT_PASS NOT set.\nTry exporting \$GIT_PASS to your github Personal Access Token in your ~/.{bash_}profile\nhttps://github.com/settings/tokens\n\n"
  ERROR=true
else
  printf "\$GIT_PASS is set\n"
fi

#*****************************************************************************
# Try to generate the ~/.git-credentials file
#*****************************************************************************
if [ "$ERROR" = true ]; then
  printf "\nERROR: Could not generate ${GC} file\nCheck your \$GIT_USER and \$GIT_PASS Environment variables.\n\n";
  exit 1
else
  # Define Credential Store Method for Git
  #*****************************************************************************
  printf "Setting .git/config to cache credentials on disk at ${GC}\n\n"
  git config --global --unset credential.helper
  git config credential.helper "store --file ${GC}"

  printf "https://${GIT_USER}:${GIT_PASS}@github.com" > ${GC}
  printf "Git Credentials stored in: ${GC}\n"
fi
