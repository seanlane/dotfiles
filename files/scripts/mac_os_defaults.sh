#! /bin/bash

echo "Setting Mac OS defaults"

# Set some defaults in Mac OS

## Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool NO
## Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
## Save screenshots to the desktop
defaults write com.apple.screencapture location -string “$HOME/Desktop”
## Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type png
## Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
