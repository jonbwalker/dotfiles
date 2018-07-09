#!/usr/bin/env bash

# Install Homebrew
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

brew install git

# Clone dotfiles repo
echo "Clone dotfiles from Github"
cd $HOME/Workspace
git clone https://github.com/jonbwalker/dotfiles.git

