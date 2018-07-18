#system aliases
alias ip='ipconfig getifaddr en0'
alias wip='ipconfig getifaddr en1'
alias indexsl='sudo mdutil -E /'

#git aliases
alias git=hub
alias gc='git checkout $1'
alias gstat='git status -s'
alias gad='git add -A'
alias dev="git checkout develop"
alias master="git checkout master"

#java aliases
alias javavs="/usr/libexec/java_home -V"
alias javav="java -version"

#docker aliases
alias dps="docker ps"
alias dup="docker-compose up"
alias ddown="docker-compose down"
alias dpull="docker-compose pull"
alias dall=" docker-compose down --rmi ‘all’"

# shortcuts
alias dfiles='cd ~/Workspace/dotfiles'
