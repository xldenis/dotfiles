#!/bin/bash

set -e

# Actually assumes Ubuntu vs OS X (shame, I know)
function platform()
{
  platform='linux'
  unamestr=`uname`

  if [[ "$unamestr" == 'Darwin' ]]; then
     platform='osx'
  fi # all linux is the same right??
  echo $platform
}

get_script_dir () {
  SOURCE="${BASH_SOURCE[0]}"
  # While $SOURCE is a symlink, resolve it
  while [ -h "$SOURCE" ]; do
      DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
      SOURCE="$( readlink "$SOURCE" )"
      # If $SOURCE was a relative symlink (so no "/" as prefix, need to resolve it relative to the symlink base directory
      [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
  done
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  echo "$DIR"
}


function install_core_osx()
{
  if test ! $(which brew)
  then
    $base_dir/osx/brew/install.sh
  fi

  cd $1
  last_run=$(date -r BREW_RUN +%s)
  last_week=$(date -v -7d +%s)

  if [ "$last_run" -lt "$last_week" ]; then
    brew bundle
    date > BREW_RUN
  else
    echo "brew bundle has run in the last week... skipping"
  fi
}

function install_core_linux()
{
  local base_dir=$1; shift
  linux_core=()
  install_plugins "$base_dir/linux" $linux_core
}

# packages that contain install instructions for both linux and os x (ie: zsh, git)
function install_core_common()
{
  echo "raise NotImplementedError"
}

function install_plugins()
{
  local base_dir=$1; shift
  local plugin_list=${@}; shift

  for pkg in $plugin_list; do
    install_path="$base_dir/$pkg/install.sh"

    if [ -r $install_path ] ; then

      source "$base_dir/$pkg/install.sh"

      if [ $(platform) == 'osx' ] ; then
        ${pkg}_install_osx
      else
        ${pkg}_install_linux
      fi
    else
      echo "could not install $pkg"
    fi
  done
}

function main()
{
  local base_dir=$(dirname $(get_script_dir))

  if [[ $(platform) == 'osx' ]] ; then
    install_core_osx $base_dir
  else
    echo "skipping linux install"
    # install_core_linux $base_dir
  fi

  lib=$(ls lib)
  langs=(haskell ruby)

  HOMEBREW_NO_AUTO_UPDATE=1

  echo "Installing plugins..."

  install_plugins "$base_dir/lib" ${lib[@]}
  # install_plugins "$base_dir/languages" ${langs[@]}
  unset HOMEBREW_NO_AUTO_UPDATE
}

main "$@"
