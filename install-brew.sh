#!/bin/bash

if [ $(uname) = Darwin ]; then 
	echo "installing Homebrew ..."
	which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
	echo "installing Linuxbrew ..."
	which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
	export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/bin$PATH"
fi

echo "run brew doctor ..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update ..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade ..."
brew upgrade

formulas=(
	git
	wget
	curl
	openssl
	cask
	docker
	vim
	gh
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
	notion
)

if [ $(uname) = Darwin ]; then 
	echo "start brew cask install apps ..."
	for cask in "${casks[@]}";
	do
		brew install --cask $cask
	done
fi

brew cleanup

cat << END

***********************************
HOMEBREW INSTALLED! bye.
***********************************

END
