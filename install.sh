#!/bin/bash

# DEFINE DIR VARS
BASH_DIR="$HOME/bashrc"
VIM_DIR="$HOME/vimrc"

# CHECK FOR AND REMOVE EXISTING DIRS
if [ -d $BASH_DIR ]; then
  rm -rf $BASH_DIR
fi

# CHECK FOR AND REMOVE EXISTING DIRS
if [ -d $VIM_DIR ]; then
  rm -rf $VIM_DIR
fi

git clone https://github.com/db-pj/bashrc $BASH_DIR && cd $BASH_DIR && ./install && cd ~ && . .bashrc

git clone https://github.com/db-pj/vimrc $VIM_DIR && cd $VIM_DIR && ./install && cd ~
