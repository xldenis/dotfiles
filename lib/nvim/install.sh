function nvim_install_osx()
{
  if ! test $(which nvim)
  then
    brew install neovim
  fi

  install_common
}

function nvim_install_linux()
{
  sudo apt-get install neovim
  install_common
}

function install_common ()
{
  if [[ -f "$HOME/.config/nvim" ]]; then
    echo "nvim config is already symlinked... skipping"
  else
    mkdir -p $HOME/.config
    ln -s "$base_dir/nvim/config" "$HOME/.config/nvim"
  fi
}
