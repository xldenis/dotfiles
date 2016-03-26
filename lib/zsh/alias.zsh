function projects() {
cd ~/Code/$1
}

alias c=projects

export DIRRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome
alias pd=popd

function vss() {
 prev_dir=$(pwd)
 c shopify/vagrant
 vagrant ssh
 cd $prev_dir
}
