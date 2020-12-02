#!/usr/bin/env bash
# Bootstrap script for installing apps on a fresh macOS machine

# Source Links
# https://dotfiles.github.io/
# https://gist.github.com/codeinthehole/26b37efa67041e1307db
# https://gist.github.com/bradp/bea76b16d3325f5c47d4
# https://www.defaults-write.com/change-default-view-style-in-os-x-finder/


# Install GNU core utilities (those that come with OS X are outdated)
#brew tap homebrew/dupes
#brew install coreutils
#brew install gnu-sed --with-default-names
#brew install gnu-tar --with-default-names
#brew install gnu-indent --with-default-names
#brew install gnu-which --with-default-names
#brew install gnu-grep --with-default-names

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

PACKAGES=(
    npm
    zsh-completions
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup
brew tap homebrew/cask-versions

CASKS=(
    google-chrome
    google-chrome-canary
    firefox
    iterm2
    slack
    spotify
    sublime-text
    spectacle
    visual-studio-code
    webstorm
    paintbrush
)

echo "Installing cask apps..."
brew cask install --appdir="/Applications" ${CASKS[@]}

echo "Installing global npm packages..."
npm install marked -g

echo "Configuring OSX..."

# example of how to read a value
## defaults read com.apple.screensaver askForPassword

# Require password as soon as screensaver or sleep mode starts
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles YES

# Enable tap-to-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable OS X Gate Keeper
# Install apps from any developer, not just  App Store apps
# sudo spctl --master-disable
# sudo defaults write /var/db/SystemPolicy-prefs.plist enabled -string no
# defaults write com.apple.LaunchServices LSQuarantine -bool false

# Use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle Nlsv

# Enable f keys
defaults write -g com.apple.keyboard.fnState -boolean true

# Set trackpad & mouse speed"
defaults write -g com.apple.trackpad.scaling 2
defaults write -g com.apple.mouse.scaling 2.5

# Enable tap to click (Trackpad) for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Don't create .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# Set Dock to auto-hide and remove the auto-hide delay
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

# Set screenshot format to PNG
defaults write com.apple.screencapture type -string "png"

# Enable Finder quit option
defaults write com.apple.finder QuitMenuItem -bool true;

# Set Key Repeat to fastest setting
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

echo "Creating folder structure..."
[[ ! -d ~/Workspace ]] && mkdir Workspace
[[ ! -d ~/ScreenShots ]] && mkdir ScreenShots

# Set screenshots location
defaults write com.apple.screencapture location ~/Screenshots

echo "Running symlinks.sh"
sh ~/Workspace/dotfiles/symlinks.sh

echo "Restarting Finder and SystemUI for changes to take effect"
killall Finder
killall SystemUIServer

echo "Custom install complete, your Macbook is ready to use ;)"
