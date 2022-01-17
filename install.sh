#!/bin/bash -ux

THIS_DIR=$(cd $(dirname $0); pwd)

echo "start setup..."
cd $HOME

# Launchpad
if [ $(uname) = Darwin ]; then
	defaults write com.apple.screencapture name "ss"
	mkdir $HOME/Pictures/ScreenShots/
	defaults write com.apple.screencapture location $HOME/Pictures/ScreenShots/
	defaults write com.apple.dock springboard-columns -int 10;defaults write com.apple.dock springboard-rows -int 6;defaults write com.apple.dock ResetLaunchPad -bool TRUE;killall Dock
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
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions

# install rbenv pyenv nodenv
anyenv install pyenv
anyenv install nodenv
exec $SHELL -l

# install iterm2 shell integration
if [ $(uname) = Darwin ]; then
	curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
fi

for file in .vimrc .zshrc .gitconfig .gitignore .czrc .tmux.conf
do
	[ ! -e $file ] && ln -s dotfiles/$file .
done

touch $HOME/.zshrc.local
mkdir $HOME/.vim/undo

# config
mkdir -p $HOME/.config/gh & ln -s $HOME/dotfiles/gh/config.yml $HOME/.config/gh/config.yml
mkdir -p $HOME/.config/bat & ln -s $HOME/dotfiles/bat/config $HOME/.config/bat/config
