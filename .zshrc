source ~/.zsh-config.zsh
source ~/.functions.zsh
source ~/.aliases.zsh

export NVM_DIR="$HOME/.nvm"
export PATH=$PATH:~/.composer/vendor/bin
export PATH=$PATH:~/Code/sendlane/sendlane/vendor/phpunit/phpunit
export PATH=$PATH:~/.config
. "/usr/local/opt/nvm/nvm.sh"
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export ANDROID_HOME=/usr/local/share/android-sdk
export PATH=$PATH:$ANDROID_HOME

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
