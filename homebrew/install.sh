if test ! $(which brew)
then
  echo " Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

brew update
brew install rbenv ruby-build

exit 0
