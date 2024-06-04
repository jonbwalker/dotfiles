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
dt1i() { envoy run deploy-dev --site=test1 --build=interface --branch="$*" ; }
dt1() { envoy run deploy-dev --site=test1 --build --branch="$*" ; }
dt2() { envoy run deploy-dev --site=test2 --build --branch="$*" ; }
dt2i() { envoy run deploy-dev --site=test2 --build=interface --branch="$*" ; }
dt3() { envoy run deploy-dev --site=test3 --build --branch="$*" ; }
dt4() { envoy run deploy-dev --site=test4 --build --branch="$*" ; }
dt5() { envoy run deploy-dev --site=test5 --build --branch="$*" ; }
dqa1() { envoy run deploy-dev --site=qa1 --build --branch="$*" ; }
dqa2() { envoy run deploy-dev --site=qa2 --build --branch="$*" ; }
esend() {
  while true; do
      send
      sleep 3
  done
}
