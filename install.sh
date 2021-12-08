#!/bin/bash -ux

THIS_DIR=$(cd $(dirname $0); pwd)

echo "start setup..."

cd $HOME
ln -s $THIS_DIR/.zshrc .

echo "installing Homebrew ..."
which brew >/dev/null 2>&1 || cd $HOME; zsh $THIS_DIR/brew.sh

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

for file in .bashrc .vimrc .gitconfig .gitignore
do
	[ ! -e $file ] && ln -s $THIS_DIR/$file .
done

vim -c 'PluginInstall'
