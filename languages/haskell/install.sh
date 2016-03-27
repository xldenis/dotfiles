
function haskell_install_osx()
{
  brew install haskell-stack
}

function haskell_install_linux()
{
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 575159689BEFB442
  echo 'deb http://download.fpcomplete.com/ubuntu wily main'|sudo tee /etc/apt/sources.list.d/fpco.list
  sudo apt-get update && sudo apt-get install stack -y
}
