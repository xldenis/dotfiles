
function brew_install_osx()
{
  version="8e6c57550e20facbf72b9f4be57321049c925fb4"
  sha="(stdin)= ca61000c4c82274b71500c0a7653468a0e4eef70"
  brew_installer="$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/$version/install)"
  if [[ "$(echo $brew_installer | openssl sha1)"  == sha ]] ; then
    /usr/bin/ruby -e $brew_installer
  else
    echo "brew: COMMIT SHA DOES NOT MATCH EXPECTED VALUE!"
  fi
}
