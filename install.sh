#!/bin/bash

BASH_DIR = "~/bashrc"
VIM_DIR = "~/vimrc"

git clone https://github.com/db-pj/bashrc $BASH_DIR && cd $BASH_DIR && ./install && cd ~ && . .bashrc

git clone https://github.com/db-pj/vimrc $VIM_DIR && cd $VIM_DIR && ./install && cd ~
