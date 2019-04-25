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

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName


# Finder
##############################################################################
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowPreviewPane -bool true
defaults write com.apple.finder ShowSidebar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show the ~/Library folder
chflags nohidden $HOME/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Restart Finder
killall -HUP Finder

# Keyboard/Mouse
##############################################################################

# Enable Function Keys
defaults write -g com.apple.keyboard.fnState -bool true

# Mouse Tracking
defaults write -g com.apple.mouse.scaling -float 1.5

# Turn Off Natual Scrolling
defaults write -g com.apple.swipescrolldirection -bool false

# Multi-Touch Mouse Settings
defaults write com.apple.AppleMultitouchMouse MouseButtonDivision -int 55
defaults write com.apple.AppleMultitouchMouse MouseButtonMode -string "TwoButton"
defaults write com.apple.AppleMultitouchMouse MouseHorizontalScroll -bool true
defaults write com.apple.AppleMultitouchMouse MouseMomentumScroll -bool true
defaults write com.apple.AppleMultitouchMouse MouseOneFingerDoubleTapGesture -int 0
defaults write com.apple.AppleMultitouchMouse MouseTwoFingerDoubleTapGesture -int 3
defaults write com.apple.AppleMultitouchMouse MouseTwoFingerHorizSwipeGesture -int 2
defaults write com.apple.AppleMultitouchMouse MouseVerticalScroll -bool true

# Screen
##############################################################################
# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Dock
##############################################################################
defaults write -g com.apple.dock autohide -bool true
defaults write -g com.apple.dock largesize -int 75
defaults write -g com.apple.dock magnification -bool true
defaults write -g com.apple.dock mod-count -int 38

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center

# Top left screen corner → Mission Control
defaults write com.apple.dock wvous-tl-corner -int 2
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Put display to sleep
#defaults write com.apple.dock wvous-tr-corner -int 10
#defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner → Desktop
defaults write com.apple.dock wvous-bl-corner -int 4
defaults write com.apple.dock wvous-bl-modifier -int 0
# Bottom right screen corner → Launchpad
#defaults write com.apple.dock wvous-br-corner -int 11
#defaults write com.apple.dock wvous-br-modifier -int 0

# Sound
##############################################################################
# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# No Beeping
defaults write -g com.apple.sound.beep.flash -bool false

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40


# Activity Monitor
##############################################################################
# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

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
