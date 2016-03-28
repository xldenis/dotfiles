
function brew_install_osx()
{
  version="8e6c57550e20facbf72b9f4be57321049c925fb4"
  sha="(stdin)= f3d8033300cd6f0d6b53f8eb1270b832d150215e"
  brew_installer="$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/$version/install)"
  web_sha=$(echo $brew_installer | openssl sha1)
  if [[ $web_sha == $sha ]] ; then
    /usr/bin/ruby -e $brew_installer
  else
    echo "brew: COMMIT SHA DOES NOT MATCH EXPECTED VALUE!"
    echo "brew: expected $sha"
    echo "brew: got $web_sha"
  fi
}
