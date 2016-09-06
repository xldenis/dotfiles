function nvim_install_linux() {
  sudo add-apt-repository ppa:neovim-ppa/unstable
  sudo apt-get update 
  sudo apt-get install neovim
  set_neovim_defaults
}

function set_neovim_defaults() {
  sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
  sudo update-alternatives --config vi
  sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
  sudo update-alternatives --config vim
  sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
  sudo update-alternatives --config editor
}
