#!/usr/bin/env bash
# Bootstrap script for installing apps on a fresh macOS machine
# https://gist.github.com/codeinthehole/26b37efa67041e1307db

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

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
    git
    lynx
    markdown
    npm
    yarn
    terminal-notifier
    vim
    wget
    zsh
    zsh-completions
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

echo "Installing cask..."
brew install caskroom/cask/brew-cask

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
    spectacle
    paintbrush
)

echo "Installing cask apps..."
brew cask install --appdir="/Applications" ${CASKS[@]}

echo "Installing fonts..."
brew tap caskroom/fonts
FONTS=(
    font-inconsolidata
    font-roboto
    font-clear-sans
)
brew cask install ${FONTS[@]}

#echo "Installing Ruby gems"
#RUBY_GEMS=(
#    bundler
#    filewatcher
#    cocoapods
#)
#sudo gem install ${RUBY_GEMS[@]}

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

# Set trackpad & mouse speed"
defaults write -g com.apple.trackpad.scaling 2
defaults write -g com.apple.mouse.scaling 2.5

echo "Creating folder structure..."
[[ ! -d Wiki ]] && mkdir Wiki
[[ ! -d Workspace ]] && mkdir Workspace

# Get my dotfiles
echo "Clone dotfiles from Github"
cd $HOME/Workspace
git clone https://github.com/jonbwalker/dotfiles.git

if test ! $(which zsh); then
    echo "Installing oh my zsh..."
    ruby -e "$(curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh)"
fi

echo "Bootstrapping complete"
