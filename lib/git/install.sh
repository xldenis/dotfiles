function git_install_osx()
{
  if test ! $(which git)
  then
    brew install git
  fi
  install_common
}

function git_install_linux()
{
  sudo apt-get install git
}


function install_common ()
{
  if [[ -f "$HOME/.gitconfig" ]]; then
    echo ".gitconfig is already symlinked... skipping"
  else
    ln -s "$base_dir/git/gitconfig.symlink" "$HOME/.gitconfig"
  fi
}

