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
    mkdir -p $HOME/.cache
    ln -s "$base_dir/nvim/config" "$HOME/.config/nvim"
    install_dein
  fi
}


function install_dein()
{
  INSTALL_DIR="$HOME/.cache/dein/repos/github.com/Shougo/dein.vim"

  # make plugin dir and fetch dein
  if ! [ -e "$INSTALL_DIR" ]; then
    echo "Begin fetching dein..."
    git clone https://github.com/Shougo/dein.vim "$INSTALL_DIR"
    echo "Done."
    echo ""
  fi
}
