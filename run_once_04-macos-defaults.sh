#!/bin/bash
# Set macOS system defaults
# chezmoi: run_once

set -e

echo "Applying macOS defaults..."

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 41
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock minimize-to-application -bool true

# Finder
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"   # list view
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Screenshots
mkdir -p "$HOME/Downloads/Sshots"
defaults write com.apple.screencapture location -string "$HOME/Downloads/Sshots"
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture disable-shadow -bool true

# Keyboard — fast key repeat
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Trackpad — tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Misc
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Restart affected apps
killall Dock 2>/dev/null || true
killall Finder 2>/dev/null || true

echo "macOS defaults applied."
