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
alias dc="docker-compose"
alias dps="docker ps"
alias dup="dc up"
alias ddown="dc down"
alias dpull="dc pull"
alias dall="dc down --rmi ‘all’"
alias dlogs="docker logs $1"
alias dexec="docker exec -it $1 /bin/bash"

# shortcuts
alias dfiles='cd ~/Workspace/dotfiles'
