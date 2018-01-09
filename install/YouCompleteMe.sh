#! /bin/bash

# Compiles YouCompleteMe
# https://github.com/Valloric/YouCompleteMe
##############################################################################

compile_ycm() {
  cd ~

  # Requirements
  sudo apt-get -y install build-essential
  sudo apt-get -y install python-dev python3-dev
  sudo add-apt-repository ppa:ubuntu-toolchain-r/test
  sudo apt-get -y update
  sudo apt-get -y install gcc-6 g++-6
  sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 60 --slave /usr/bin/g++ g++ /usr/bin/g++-6
  sudo apt-get -y install cmake
  sudo apt-get -y install golang-go

  # Compile YCM
  cd ~/.vim/bundle/YouCompleteMe
  CXX="/usr/bin/g++-6" CC="/usr/bin/gcc-6" ./install.py --tern-completer 
}

compile_ycm
