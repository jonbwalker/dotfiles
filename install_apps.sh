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
    terminal-notifier
    vim
    zsh
    zsh-completions
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

CASKS=(
    google-chrome
    firefox
    iterm2
    macvim
    skype
    slack
    spotify
    sublime-text
    spectacle
    visual-studio-code
    webstorm
    paintbrush
    bettertouchtool
)

echo "Installing cask apps..."
brew cask install --appdir="/Applications" ${CASKS[@]}

echo "Installing global npm packages..."
npm install marked -g

echo "Configuring OSX..."

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
sudo spctl --master-disable
sudo defaults write /var/db/SystemPolicy-prefs.plist enabled -string no
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle Nlsv

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
# defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

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

echo "Creating folder structure..."
[[ ! -d ~/Workspace ]] && mkdir Workspace
[[ ! -d ~/ScreenShots ]] && mkdir ScreenShots

# Set screenshots location
defaults write com.apple.screencapture location ~/Screenshots

echo "Running symlinks.sh"
sh ~/Workspace/dotfiles/symlinks.sh

if test ! $(which zsh); then
    echo "Installing oh my zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

echo "Restarting Finder and SystemUI for changes to take effect"
killall Finder
killall SystemUIServer

echo "Custom install complete, your Macbook is ready to use ;)"
