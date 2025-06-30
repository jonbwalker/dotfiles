#!/usr/bin/env bash
# Bootstrap script for installing apps on a fresh macOS machine
# Source Links
# https://dotfiles.github.io/
# https://gist.github.com/codeinthehole/26b37efa67041e1307db
# https://gist.github.com/bradp/bea76b16d3325f5c47d4
# https://www.defaults-write.com/change-default-view-style-in-os-x-finder/

# Global definitions for packages and casks
PACKAGES=(
    npm
    zsh-completions
)

CASKS=(
    google-chrome
    google-chrome@canary
    flycut
    firefox
    iterm2
    slack
    spotify
    visual-studio-code
    webstorm
    paintbrush
    sequel-ace
    zoom
)

# --- Function Definitions ---

# Install GNU core utilities (commented out, preserved from original)
# install_gnu_utilities() {
#   echo "Installing GNU utilities..."
#   brew tap homebrew/dupes
#   brew install coreutils
#   brew install gnu-sed --with-default-names
#   brew install gnu-tar --with-default-names
#   brew install gnu-indent --with-default-names
#   brew install gnu-which --with-default-names
#   brew install gnu-grep --with-default-names
#   # Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
#   brew install findutils
#   # Install Bash 4
#   brew install bash
# }

install_brew_packages() {
    echo "Installing Homebrew packages..."
    brew install "${PACKAGES[@]}"
    echo "Cleaning up Homebrew..."
    brew cleanup
}

install_cask_apps() {
    echo "Installing Cask applications..."
    brew install --cask --appdir="/Applications" "${CASKS[@]}"
}

install_nvm() {
    echo "Installing NVM (Node Version Manager)..."
    # Installs NVM v0.40.3 specifically
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
}

configure_macos_settings() {
    echo "Configuring macOS settings..."

    # Require password as soon as screensaver or sleep mode starts
    defaults write com.apple.screensaver askForPassword -int 1
    defaults write com.apple.screensaver askForPasswordDelay -int 0

    # Show filename extensions by default
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true

    # Use mouse scroll wheel in Vim (for iTerm2)
    defaults write com.googlecode.iterm2 AlternateMouseScroll -bool true

    # Show hidden files by default
    defaults write com.apple.finder AppleShowAllFiles -bool true

    # Disable OS X Gate Keeper (Uncomment if needed, use with caution)
    # echo "Disabling Gate Keeper (requires sudo privileges)..."
    # sudo spctl --master-disable
    # sudo defaults write /var/db/SystemPolicy-prefs.plist enabled -string no
    # defaults write com.apple.LaunchServices LSQuarantine -bool false

    # Use list view in all Finder windows by default
    defaults write com.apple.finder FXPreferredViewStyle Nlsv

    # Enable F keys (use F1, F2, etc. keys as standard function keys)
    defaults write -g com.apple.keyboard.fnState -boolean true

    # Set trackpad & mouse speed
    defaults write -g com.apple.trackpad.scaling 2
    defaults write -g com.apple.mouse.scaling 2.5

    # Enable tap to click (Trackpad) for this user and for the login screen
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
    defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
    defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

    # Don't create .DS_Store files on network volumes
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

    # Set Dock to auto-hide and minimize the auto-hide delay
    defaults write com.apple.dock autohide -bool true
    defaults write com.apple.dock autohide-delay -float 0.1       # Delay before Dock hides
    defaults write com.apple.dock autohide-time-modifier -float 0.2 # Speed of hide/show animation

    # Set screenshot format to PNG
    defaults write com.apple.screencapture type -string "png"

    # Enable Finder quit option
    defaults write com.apple.finder QuitMenuItem -bool true

    # Set Key Repeat to fastest setting
    defaults write -g InitialKeyRepeat -int 15 # Time until key repeat starts (lower is faster)
    defaults write -g KeyRepeat -int 2         # Key repeat rate (lower is faster)

    # Set rearrange spaces (Desktops) based on recent use to false
    defaults write com.apple.dock mru-spaces -bool false
}

create_user_directories() {
    echo "Creating user directories..."
    [[ ! -d "$HOME/Workspace" ]] && mkdir "$HOME/Workspace"
    [[ ! -d "$HOME/Screenshots" ]] && mkdir "$HOME/Screenshots"

    # Set screenshots location
    defaults write com.apple.screencapture location "$HOME/Screenshots"
    echo "Screenshots will be saved to $HOME/Screenshots"
}

setup_symlinks() {
    local symlinks_script_path="$HOME/Workspace/dotfiles/symlinks.sh"
    if [ -f "$symlinks_script_path" ]; then
        echo "Running symlinks.sh..."
        sh "$symlinks_script_path"
    else
        echo "Warning: Symlinks script not found at $symlinks_script_path"
    fi
}

install_oh_my_zsh() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "Installing Oh My Zsh..."
        # The installer might try to change the shell, ensure Zsh is installed first
        if ! command -v zsh &> /dev/null; then
            echo "Zsh not found. Please install Zsh first."
        fi
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    else
        echo "Oh My Zsh is already installed."
    fi
}

restart_ui_services() {
    echo "Restarting Finder, Dock, and SystemUIServer for changes to take effect..."
    killall Finder
    killall Dock
    killall SystemUIServer
}

# --- Main Script Execution ---
main() {
    echo "Starting macOS bootstrap process..."

    # install_gnu_utilities # Uncomment if needed
    install_brew_packages
    install_cask_apps
    install_nvm
    configure_macos_settings
    create_user_directories
    setup_symlinks
    install_oh_my_zsh
    restart_ui_services

    echo "Custom macOS setup complete. Your MacBook is ready to use! ;)"
    echo "Note: Some changes might require a full restart to take effect."
}

main
