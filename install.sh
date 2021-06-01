#!/bin/bash -ux

THIS_DIR=$(cd $(dirname $0); pwd)

echo "start setup..."
cd $HOME

# install Vundle for vim plugin
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

for file in .vimrc .zshrc .gitconfig .gitignore .czrc .tmux.conf
do
	[ ! -e $file ] && ln -s dotfiles/$file .
done

echo 'export PATH=~/homebrew/bin:$PATH' >> ~/.zshrc.local

echo "installing Homebrew ..."
which brew >/dev/null 2>&1 || cd $HOME; curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh

cd $THIS_DIR

echo "run brew doctor ..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update ..."
brew update

echo "ok. run brew upgrade ..."
brew upgrade
brew install font-hack-nerd-font --cask
brew cleanup

# config
mkdir -p $HOME/.config/gh & ln -s $HOME/dotfiles/gh/config.yml $HOME/.config/gh/config.yml
mkdir -p $HOME/.config/bat & ln -s $HOME/dotfiles/bat/config $HOME/.config/bat/config
