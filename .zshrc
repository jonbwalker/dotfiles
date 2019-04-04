# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
 export ZSH=/Users/jonbwalker/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=( git zsh-nvm )

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#system aliases
alias ip='ipconfig getifaddr en0'
alias pip='curl https://ipinfo.io/ip'
alias wip='ipconfig getifaddr en1'
alias indexsl='sudo mdutil -E /'
alias ref=". ~/.zshrc"
alias debug="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222 --user-data-dir=/tmp/chrome-debug"

#git aliases
alias gc='git checkout $1'
alias gstat='git status -s'
alias gad='git add -A'
alias dev="git checkout develop"
alias master="git checkout master"
alias grs="git reset --soft HEAD^"
alias fbranch="gup && gcb"
alias branch="sl && gcf && fbranch"

#git functions
feat() {git checkout feature/"$@"}
bug() {git checkout bugfix/"$@"}
release() {git checkout release/"$@"}
gfeat() {
        git stash
        sleep 3
        git pull origin --rebase
        git checkout feature/"$@"
        git stash pop
}
gbug() {
	git stash
        sleep 3
        git pull origin --rebase
        git checkout bugfix/"$@"
	git stash pop
}

#npm script aliaes
alias ni="npm i"
alias nrm="rm -rf node_modules && ni"

#java aliases
alias javavs="/usr/libexec/java_home -V" 
alias javav="java -version"

#php aliases
alias art="sl && php artisan"
alias rseed="cda && art db:seed --class="

#sendlane aliases
alias hs="cd ~/Homestead"
alias sl="cd ~/code/sendlane/sendlane"
alias sli="cd ~/code/sendlane/sendlane/resources/assets/mix/interface/views"
alias gcm="gc master"
alias gca="gc feature/automation-builder"
alias nh="npm run hot"
alias nd="npm run dev"
alias nho="npm run hot:ops"
alias nw="npm run watch"
alias ntw="npm run test:watch"
alias ntc="npm run test:coverage"
alias mmain="art migrate --path=database/migrations/BaseMigrations"
alias mtenant="art migrate:tenants --tenantdb _user"

#composer aliases
alias ca='composer dump-autoload'
alias ci="composer install"
alias cu="composer update"
alias cc="composer clear-cache"

#docker aliases
alias dc="docker-compose"
alias dps="docker ps"
alias dup="dc up"
alias ddown="dc down"
alias dpull="dc pull"
alias dall=" dc down --rmi ‘all’"
alias dlogs="docker logs $1"
alias dexec="docker exec -it $1 /bin/bash"

# shortcuts
alias dfiles='cd ~/Workspace/dotfiles'
alias vzsh='vim ~/.zshrc'
alias jbw="~//Workspace/jonbwalker.com"

export NVM_DIR="$HOME/.nvm"
export PATH=$PATH:~/.composer/vendor/bin
export PATH=$PATH:~/Code/sendlane/sendlane/vendor/phpunit/phpunit
export PATH=$PATH:~/.config
. "/usr/local/opt/nvm/nvm.sh"
#export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

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
