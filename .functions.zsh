#git functions
feat() { git checkout feature/"$@" }
bug() { git checkout bugfix/"$@" }
release() { git checkout release/"$@" }
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
