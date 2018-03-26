main() {

  print_in_purple "\n   Zsh\n   ------------------------------\n"

  # Only enable exit-on-error after the non-critical colorization stuff,
  # which may fail on systems lacking tput or terminfo
  set -e

  CHECK_ZSH_INSTALLED=$(grep /zsh$ /etc/shells | wc -l)
  if [ ! $CHECK_ZSH_INSTALLED -ge 1 ]; then
    print_error "Zsh is not installed! Attempting to install zsh...\n"
    execute "sudo apt-get -y install zsh > /dev/null 2>&1" "Installing Zsh"
  fi
  unset CHECK_ZSH_INSTALLED
  
  CHECK_ZSH_INSTALLED=$(grep /zsh$ /etc/shells | wc -l)
  if [ ! $CHECK_ZSH_INSTALLED -ge 1 ]; then
    print_error "Zsh could not be installed! Please try to install manually.\n"
    exit 1
  else
    print_success "Zsh installed!"
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
  
  # INSTALL oh-my-zsh
  execute "env git clone --quiet --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH &> /dev/null" "Installing oh-my-zsh"

  # If this user's login shell is not already "zsh", attempt to switch.
  TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
  if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
	# If this platform provides a "chsh" command (not Cygwin), do it, man!
	#if hash chsh >/dev/null 2>&1; then
	  #print_success "Changing your default shell to zsh...\n\t"
	  #sudo chsh -s $(which zsh)
	  #print_success 'Shell changed to zsh! Log out and log back in to complete shell switch.'
	## Else, suggest the user do so manually.
	#else
	  #print_error "I can't change your shell automatically because this system does not have chsh.\n"
	  #print_error "Please manually change your default shell to zsh!\n"
	#fi
	#else
	 #print_success 'Zsh is current shell'
	print_warning 'To change your sell to zsh run this command:\n\tchsh -s $(which zsh)'
  fi

  env zsh
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main
