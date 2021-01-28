#!/bin/zsh

if [ $(uname) = Darwin ]; then 
	echo "installing Homebrew ..."
	which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
	echo "installing Linuxbrew ..."
	which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
	export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/bin:$PATH"
fi

echo "run brew doctor ..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update ..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade ..."
brew upgrade

formulas=(
	anyenv
	cask
	cloc
	curl
	docker
	gh
	git
	nasm
	openssl
	vim
	wget
	starship
	minikube
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
	deepl
	amethyst
	toggl-track
)

if [ $(uname) = Darwin ]; then 
	echo "start brew cask install apps ..."
	for cask in "${casks[@]}";
	do
		brew install --cask $cask
	done
fi

brew cleanup

# install Vundle for vim plugin
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install rbenv pyenv nodenv
anyenv install rbenv
anyenv install pyenv
anyenv install nodenv
exec $SHELL -l

# config
mkdir -p $HOME/.config/gh & ln -s $HOME/dotfiles/gh/config.yml $HOME/.config/gh/config.yml

cat << END

***********************************
HOMEBREW INSTALLED! bye.
***********************************

END
