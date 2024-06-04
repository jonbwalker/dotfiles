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
alias glast='git log -n1 -p'

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
alias nid='npm -g ls --depth=0'
alias ncc='npm cache clean --force'

#npx aliases
alias ntm='npx majestic --app'

#sendlane aliases
alias sl='cd ~/Sites/sendlane'
alias sli='cd ~/Sites/sendlane/resources/assets/mix/interface/views'
alias nh='npm run hot'
alias nd='npm run dev'
alias nho='npm run hot:ops'
alias nw='build=interface npm run watch'
alias nsd='build=scripts npm run dev'
alias nsw='build=static npm run watch'
alias neew='build=emailEditor npm run watch'
alias na='npn run dev-all'
alias ntw='npm run test:watch'
alias ntc='npm run test:coverage'
alias pa='analyze=true build=interface npm run prod'
alias dcc='art helpers:clear-dashboard-cache --domain=user'
alias hc='art helpers:clear-cache'
source ~/.sendlane-profile

#sendlane deploys
alias t1b='envoy run deploy-test1 --currentbranch'
alias t2b='envoy run deploy-test2 --currentbranch'
alias t3b='envoy run deploy-test3 --currentbranch'
alias t4b='envoy run deploy-test4 --currentbranch'
alias edp='envoy run deploy-web'

#php aliases
alias art='sl && php artisan'
alias rseed='art db:seed --class='
alias ac='art config:cache'
alias acc='art config:clear'
alias bc='ca && cc && acc'

#php artisan commands
alias mmain='art migrate --path=database/migrations/main'
alias mtenant='art migrate:tenants --tenantdb _user'
alias mdeliver="php artisan migrate --path=database/migrations/deliverability --database deliverability"
alias mtest="DB_DATABASE=test mmain"
alias mtrollback='art migrate:tenants_rollback'
alias formq='art queue:listen --queue=forms'
alias massD='art massDelete:subscribers'
alias send='art schedule:run'
alias qw='php artisan queue:work'
alias qra="art queue:retry all"
alias rh='art horizon'
alias disb='art campaign:dispatch-batches'

#composer aliases
alias ca='composer dump-autoload'
alias ci='composer install --ignore-platform-reqs'
alias cu='composer update --ignore-platform-reqs'
alias cc='composer clear-cache'

#brew aliases
alias brm='brew services restart mysql@5.7'

