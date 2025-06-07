#system aliases
alias ip='ipconfig getifaddr en0'
alias pip='curl https://ipinfo.io/ip'
alias wip='ipconfig getifaddr en1'
alias indexsl='sudo mdutil -E /'
alias ref='. ~/.zshrc'

#git aliases
alias gc='git checkout $1'
alias gcm='gc main'
alias gpr='git pull --rebase'
alias gref='git stash && gpr && git stash pop'
alias st='git status -s'
alias gad='git add -A'
alias grs='git reset --soft HEAD^'
alias fbranch='gup && gcb'
alias branch='gcf && fbranch'
alias gpm='git pull origin main'
alias gstat='git status -s'
alias glast='git log -n1 -p'

# shortcuts
alias dfiles='cd ~/Workspace/dotfiles'
alias vzsh='vim ~/.aliases.zsh'

#npm global aliaes
alias ni='npm i'
alias nrm='rm -rf node_modules && ni'
alias nid='npm -g ls --depth=0'
alias ncc='npm cache clean --force'

#npx aliases
alias ntm='npx majestic --app'
