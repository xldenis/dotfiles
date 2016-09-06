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
  local base_dir=$1; shift
  osx_core=(brew)
  install_plugins "$base_dir/osx" $osx_core
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
  local base_dir=$1; shift
  common_core=(nvim zsh)
  install_plugins "$base_dir/lib" $common_core
}

function install_plugins()
{
  local base_dir=$1; shift
  local plugin_list=$1; shift

  for pkg in $plugin_list; do
    install_path="$base_dir/$pkg/install.sh"

    if [ -r $install_path ] ; then

      source "$base_dir/$pkg/install.sh"

      if [ $(platform) == 'osx' ] ; then
        ${pkg}_install_osx
      else
        ${pkg}_install_linux
      fi
      echo "finished installing $pkg"
    else
      echo "could not install $pkg"
    fi
  done
}

function main()
{
   local base_dir=$(dirname $(get_script_dir))
  
  install_core_common $base_dir
  if [[ $(platform) == 'osx' ]] ; then
    install_core_osx $base_dir
  else
    install_core_linux $base_dir
  fi

  langs=(haskell ruby)
  install_plugins "$base_dir/languages" $langs
}

main "$@"
