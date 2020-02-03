source ~/.zsh-config.zsh
source ~/.functions.zsh
source ~/.aliases.zsh

JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
ANDROID_HOME=/usr/local/share/android-sdk
NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

PATH=$PATH:~/.composer/vendor/bin
PATH=$PATH:~/Code/sendlane/sendlane/vendor/phpunit/phpunit
PATH=$PATH:~/.config
PATH=$PATH:$ANDROID_HOME

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/jonbwalker/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

###-tns-completion-start-###
if [ -f /Users/jonbwalker/.tnsrc ]; then
    source /Users/jonbwalker/.tnsrc
fi
###-tns-completion-end-###
