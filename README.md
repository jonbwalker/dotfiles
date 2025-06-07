# Dotfiles

This repository contains configuration files and scripts for setting up a new macOS machine.

## Getting Started

1. Run the `start-here.sh` script to install Homebrew and clone this repository.
2. The script will then run `install_apps.sh` to install applications and configure macOS settings.
3. Finally, `symlinks.sh` will create symbolic links from this repository to your home directory.

## macOS Compatibility

These dotfiles have been tested and are compatible with:
- macOS 15.5 (Sequoia)

## Recent Changes

- Updated `defaults write` commands for compatibility with macOS 15.5:
  - Changed `AppleShowAllFiles YES` to `AppleShowAllFiles -bool true`
  - Updated key repeat settings to use minimum allowed values (15 for InitialKeyRepeat, 2 for KeyRepeat)
  - Changed Dock animation settings to use small non-zero values instead of 0
