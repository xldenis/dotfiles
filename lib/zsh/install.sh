function zsh_install_osx()
{
  if ! test $(which zsh); then
    brew install zsh
  fi

  install_common
}

function zsh_install_linux()
{
  sudo apt-get install zsh
  install_common
}

function install_common ()
{
  if [ $SHELL != "/usr/local/bin/zsh" ]; then
    chsh -s "$(which zsh)"
  fi

  # git clone git@github.com:zsh-users/zsh-syntax-highlighting "$base_dir/zsh/zsh-syntax-highlighting"

  if [[ -f "$HOME/.zshrc" ]]; then
    echo ".zshrc is already symlinked... skipping"
  else
    ln -s "$base_dir/zsh/zshrc.symlink" "$HOME/.zshrc"
  fi
}
