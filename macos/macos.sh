#!/usr/bin/env bash

. "$HOME/dotfiles/install/utils.sh"
verify_osx


osascript -e 'display notification "Setting Mac OS X Preferences" with title "Mac OS X Setup"'

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# General UI/UX
##############################################################################

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes


# Keyboard/Mouse
##############################################################################

# Enable Function Keys
defaults write -g com.apple.keyboard.fnState -bool true

# Mouse Tracking
defaults write -g com.apple.mouse.scaling -float 1.5

# Turn Off Natual Scrolling
defaults write -g com.apple.swipescrolldirection -bool false

# Multi-Touch Mouse Settings
defaults write com.apple.AppleMultitouchMouse.MouseButtonDivision -int 55
defaults write com.apple.AppleMultitouchMouse.MouseButtonMode -string "TwoButton"
defaults write com.apple.AppleMultitouchMouse.MouseHorizontalScroll -bool true
defaults write com.apple.AppleMultitouchMouse.MouseMomentumScroll -bool true
defaults write com.apple.AppleMultitouchMouse.MouseOneFingerDoubleTapGesture -int 0
defaults write com.apple.AppleMultitouchMouse.MouseTwoFingerDoubleTapGesture -int 3
defaults write com.apple.AppleMultitouchMouse.MouseTwoFingerHorizSwipeGesture -int 2
defaults write com.apple.AppleMultitouchMouse.MouseVerticalScroll -bool true


# Dock
##############################################################################
defaults write -g com.apple.springing.delay -float 0.5
defaults write -g com.apple.springing.enabled -bool true


# Sound
##############################################################################

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# No Beeping
defaults write -g com.apple.sound.beep.flash -bool false

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Chrome
##############################################################################
# Disable swipe navigation
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

# Use the system-native print preview dialog
defaults write com.google.Chrome DisablePrintPreview -bool true
defaults write com.google.Chrome.canary DisablePrintPreview -bool true

# Expand the print dialog by default
defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true
