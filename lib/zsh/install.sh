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
  echo "DONE"
}
