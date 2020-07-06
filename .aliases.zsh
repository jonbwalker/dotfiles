#system aliases
alias ip='ipconfig getifaddr en0'
alias pip='curl https://ipinfo.io/ip'
alias wip='ipconfig getifaddr en1'
alias indexsl='sudo mdutil -E /'
alias ref='. ~/.zshrc'
alias debug='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222'

#git aliases
alias gc='git checkout $1'
alias gcm='gc main'
alias gpr='git pull --rebase'
alias gref='git stash && gpr && git stash pop'
alias st='git status -s'
alias gad='git add -A'
alias grs='git reset --soft HEAD^'
alias fbranch='gup && gcb'
alias branch='sl && gcf && fbranch'
alias gpm='git pull origin main'
alias gstat='git status -s'

#java aliases
alias javavs='/usr/libexec/java_home -V'
alias javav='java -version'

# shortcuts
alias dfiles='cd ~/Workspace/dotfiles'
alias vzsh='vim ~/.aliases.zsh'
alias jbw='~//Workspace/jonbwalker.com'

#npm global aliaes
alias ni='npm i'
alias nrm='rm -rf node_modules && ni'

#npx aliases
alias ntm='npx majestic --app'

#java aliases
alias javavs='/usr/libexec/java_home -V'
alias javav='java -version'

#sendlane aliases
alias hs='cd ~/Homestead'
alias sl='cd ~/code/sendlane/sendlane'
alias sli='cd ~/code/sendlane/sendlane/resources/assets/mix/interface/views'
alias nh='npm run hot'
alias nd='npm run dev'
alias nho='npm run hot:ops'
alias nw='build=interface npm run watch'
alias nsd='build=scripts npm run dev'
alias nsw='build=static npm run watch'
alias na='npn run dev-all'
alias ntw='npm run test:watch'
alias ntc='npm run test:coverage'
alias pa='analyze=true build=interface npm run prod'
alias eds='envoy run deploy-staging --branch=feature/new-dashboard'
alias dcc='art helpers:clear-dashboard-cache --domain=user'
source ~/.sendlane-profile

#php aliases
alias art='sl && php artisan'
alias rseed='cda && art db:seed --class='
alias ac='art config:cache'
alias acc='art config:clear'
alias bc='ca && cc && acc'

#php artisan commands
alias mmain='art migrate --path=database/migrations/main'
alias mtenant='art migrate:tenants --tenantdb _user'
alias mtest="DB_DATABASE=test mmain"
alias mtrollback='art migrate:tenants_rollback'
alias formq='php artisan queue:listen --queue=forms'
alias massD='php artisan massDelete:subscribers'

#composer aliases
alias ca='composer dump-autoload'
alias ci='composer install'
alias cu='composer update'
alias cc='composer clear-cache'

#docker aliases
alias dc='docker-compose'
alias dps='docker ps'
alias dup='dc up'
alias ddown='dc down'
alias dpull='dc pull'
alias dall=" dc down --rmi ‘all’"
alias dlogs='docker logs $1'
alias dexec='docker exec -it $1 /bin/bash'
