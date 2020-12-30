#!/bin/bash
echo "installing homebrew ..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "run brew doctor ..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update ..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade ..."
brew upgrade --all

formulas=(
	git
	wget
	curl
	openssl
	cask
	doker
	vim
)

echo "brew tap ..."
brew tap homebrew/cask-fonts

echo "start brew install apps ..."
for formula in "${formulas[@]}";
do
	brew install $formula || brew upgrade $formula
done

casks=(
	iterm2
	slack
	keepingyouawake
	docker
	google-chrome
	karabiner-elements
	discord
	font-hack-nerd-font
)

echo "start brew cask install apps ..."
for cask in "${casks[@]}J";
do
	brew cask install $cask
done

brew cleanup
brew cask cleanup

cat << END

***********************************
HOMEBREW INSTALLED! bye.
***********************************

END
