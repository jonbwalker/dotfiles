#git functions
feat() { git checkout feature/"$*" ; }
bug() { git checkout bugfix/"$*" ; }
release() { git checkout release/"$*" ; }
gfeat() {
        git stash
        sleep 3
        git pull origin --rebase
        git checkout feature/"$*"
        git stash pop
}
gbug() {
        git stash
        sleep 3
        git pull origin --rebase
        git checkout bugfix/$*
        git stash pop
}
dt2() { envoy run deploy-test2 --branch="$*" ; }
dt3() { envoy run deploy-test3 --branch="$*" ; }
dt4() { envoy run deploy-test4 --branch="$*" ; }
dqa() { envoy run deploy-qa --branch="$*" ; }
