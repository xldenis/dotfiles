function projects() {
cd ~/Code/$1
}

alias c=projects

export DIRRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome
alias pd=popd
