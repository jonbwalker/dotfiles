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
brew update || exit 1

brew install git

# Clone dotfiles repo
echo "Clone dotfiles from Github"
[[ ! -d Workspace ]] && mkdir Workspace
cd $HOME/Workspace
git clone https://github.com/jonbwalker/dotfiles.git

ask_for_confirmation "Are you ready to start the main install?"
    if yes; then
        sh install_apps.sh
    else
         # Print output in red
         printf "\e[0;31m  [✖] install cancelled\e[0m\n"
    fi

ask_for_confirmation() {
    print_question "$1 (y/n) "
    read -n 1
    printf "\n"
}

yes() {
    [[ "$REPLY" =~ ^[Yy]$ ]] \
        && return 0 \
        || return 1
}
