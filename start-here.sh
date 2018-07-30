#!/usr/bin/env bash

# https://github.com/Homebrew/brew/issues/2062
sudo chown -R $USER:admin /usr/local

# Install Homebrew
if test ! $(which brew); then
    echo "Installing homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

brew install git

# Clone dotfiles repo
echo "Clone dotfiles from Github"
[[ ! -d Workspace ]] && mkdir Workspace
cd $HOME/Workspace
if [ ! -d dotfiles ]; then
  git clone https://github.com/jonbwalker/dotfiles.git
else
  printf "dotfiles already exists"
fi

read -p "Are you ready to start the main install?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sh install_apps.sh
else
 # Print output in red
    printf "\e[0;31m  [✖] install cancelled\e[0m\n"
fi
