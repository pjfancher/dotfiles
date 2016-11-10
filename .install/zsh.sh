main() {

  print_in_purple "\n   Zsh\n   ------------------------------\n"
  
  # Use colors, but only if connected to a terminal, and that terminal
  # supports them.
  if which tput >/dev/null 2>&1; then
      ncolors=$(tput colors)
  fi
  if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    BOLD="$(tput bold)"
    NORMAL="$(tput sgr0)"
  else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    BOLD=""
    NORMAL=""
  fi

  # Only enable exit-on-error after the non-critical colorization stuff,
  # which may fail on systems lacking tput or terminfo
  set -e

  CHECK_ZSH_INSTALLED=$(grep /zsh$ /etc/shells | wc -l)
  if [ ! $CHECK_ZSH_INSTALLED -ge 1 ]; then
    print_error "   Zsh is not installed! Please install zsh first!\n"
    sudo apt-get install zsh
  fi
  unset CHECK_ZSH_INSTALLED
 
  ZSH=''
  if [ ! -n "$ZSH" ]; then
    ZSH=~/.oh-my-zsh
  fi

  if [ -d "$ZSH" ]; then
    rm -rf $ZSH
  fi

  # Prevent the cloned repository from having insecure permissions. Failing to do
  # so causes compinit() calls to fail with "command not found: compdef" errors
  # for users with insecure umasks (e.g., "002", allowing group writability). Note
  # that this will be ignored under Cygwin by default, as Windows ACLs take
  # precedence over umasks except for filesystems mounted with option "noacl".
  umask g-w,o-w

  #printf "${GREEN}   Cloning oh-my-zsh...${NORMAL}\n"
  hash git >/dev/null 2>&1 || {
    echo "Error: git is not installed"
    exit 1
  }
  # The Windows (MSYS) Git is not compatible with normal use on cygwin
  if [ "$OSTYPE" = cygwin ]; then
    if git --version | grep msysgit > /dev/null; then
      echo "Error: Windows/MSYS Git is not supported on Cygwin"
      echo "Error: Make sure the Cygwin git package is installed and is first on the path"
      exit 1
    fi
  fi
  env git clone --quiet --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH &> /dev/null || {
    printf "Error: git clone of oh-my-zsh repo failed\n"
    exit 1
  }
  print_success "   Installed oh-my-zsh"

  #printf "${BLUE}Looking for an existing zsh config...${NORMAL}\n"
  #if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
  #  printf "${YELLOW}Found ~/.zshrc.${NORMAL} ${GREEN}Backing up to ~/.zshrc.pre-oh-my-zsh${NORMAL}\n";
  #  mv ~/.zshrc ~/.zshrc.pre-oh-my-zsh;
  #fi

  #printf "${BLUE}Using the Oh My Zsh template file and adding it to ~/.zshrc${NORMAL}\n"
  #cp $ZSH/templates/zshrc.zsh-template ~/.zshrc
  #sed "/^export ZSH=/ c\\
  #export ZSH=$ZSH
  #" ~/.zshrc > ~/.zshrc-omztemp
  #mv -f ~/.zshrc-omztemp ~/.zshrc

  # If this user's login shell is not already "zsh", attempt to switch.
  TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
  if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
    # If this platform provides a "chsh" command (not Cygwin), do it, man!
    if hash chsh >/dev/null 2>&1; then
      printf "${GREEN}\n   Changing your default shell to zsh...${NORMAL}\n\t"
      chsh -s $(grep /zsh$ /etc/shells | tail -1) < /dev/tty
      print_success '   Shell changed to zsh!'
      print_warning '   Log out and log back in to complete shell switch'
    # Else, suggest the user do so manually.
    else
      printf "I can't change your shell automatically because this system does not have chsh.\n"
      printf "${RED}Please manually change your default shell to zsh!${NORMAL}\n"
    fi
    else
     printf "${GREEN}"
     print_success '   Zsh is current shell'
  fi

  printf "${NORMAL}"
  env zsh
}

main
