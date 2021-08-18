#!/bin/bash -ux

THIS_DIR=$(cd $(dirname $0); pwd)

echo "start setup..."

cd $HOME
ln -s dotfiles/.zshrc .

echo "installing Homebrew ..."
which brew >/dev/null 2>&1 || cd $HOME; curl https://brew.42.fr | zsh

cd $THIS_DIR

echo "run brew doctor ..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update ..."
brew update

echo "ok. run brew upgrade ..."
brew upgrade
brew install font-hack-nerd-font --cask
brew cleanup

cd $HOME
# install Vundle for vim plugin
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

for file in .vimrc .gitconfig .gitignore
do
	[ ! -e $file ] && ln -s dotfiles/$file .
done
