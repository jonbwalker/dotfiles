#!/usr/bin/env bash

# https://github.com/Homebrew/brew/issues/2062
# sudo chown -R $USER:admin /usr/local

# Install Homebrew
if test ! $(which brew); then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/jonbwalker/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

brew install git

# Clone dotfiles repo
echo "Cloning dotfiles from Github..."

echo "Creating Workspace directory"
[[ ! -d Workspace ]] && mkdir Workspace

echo "Navigating to $HOME/Workspace"
cd $HOME/Workspace

if [ ! -d dotfiles ]; then
  git clone https://github.com/jonbwalker/dotfiles.git
else
  printf "dotfiles already exists"
  echo
fi

# Confirm before installing system apps
read -p "Are you ready to start the main install? (y/n)" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sh ~/Workspace/dotfiles/install_apps.sh
else
 # Print output in red
    printf "\e[0;31m  [✖] install cancelled\e[0m\n"
fi
