function git_install_osx()
{
  brew install git
  # setup_configs # maybe instead have a common link_configs function?
}

function git_install_linux()
{
  sudo apt-get install git
}
