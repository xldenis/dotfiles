function projects() {
cd ~/Code/$1
}

alias c=projects

export DIRRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome
alias pd=popd

kube () {
    kubectl config use-context $1
    if [ "$#" -ne 1 ]
    then
        kubectl config set-context $1 --namespace $2
    fi
}

alias k=kubectl
