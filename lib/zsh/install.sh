function zsh_install_osx()
{
  brew install zsh
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

  # ln -s "$base_dir/zsh/zshrc.symlink" "$HOME/.zshrc"
}
