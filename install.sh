#!/bin/bash -ux

THIS_DIR=$(cd $(dirname $0); pwd)

if [ $(uname) = Linux ]; then
	cd $THIS_DIR
	git submodule init
	git submodule update
fi

echo "start setup..."
cd $HOME

for file in .vimrc .zshrc .gitconfig .gitignore .czrc .tmux.conf
do
	[ ! -e $file ] && ln -s dotfiles/$file .
done

touch ~/.zshrc.local

# Launchpad
if [ $(uname) = Darwin ]; then 
	defaults write com.apple.screencapture name "ss"
	mkdir ~/Pictures/ScreenShots/
	defaults write com.apple.screencapture location ~/Pictures/ScreenShots/
	defaults write com.apple.dock springboard-columns -int 10;defaults write com.apple.dock springboard-rows -int 6;defaults write com.apple.dock ResetLaunchPad -bool TRUE;killall Dock
	echo "installing Homebrew ..."
	which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
	echo "installing Linuxbrew ..."
	which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
	export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/bin:$PATH"
fi

cd $THIS_DIR

echo "run brew doctor ..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update ..."
brew update

echo "ok. run brew upgrade ..."
brew upgrade

brew bundle

brew cleanup

# install Vundle for vim plugin
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install rbenv pyenv nodenv
anyenv install rbenv
anyenv install pyenv
anyenv install nodenv
exec $SHELL -l

# install iterm2 shell integration
if [ $(uname) = Darwin ]; then
	curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
fi

# config
mkdir -p $HOME/.config/gh & ln -s $HOME/dotfiles/gh/config.yml $HOME/.config/gh/config.yml
mkdir -p $HOME/.config/bat & ln -s $HOME/dotfiles/bat/config $HOME/.config/bat/config
