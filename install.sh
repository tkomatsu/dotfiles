#!/bin/bash
set -u
#set -x

THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR
git submodule init
git submodule update

#echo $THIS_DIR

echo "start setup..."
cd $HOME

for file in .vimrc .zshrc .gitconfig
do
	[ ! -e $file ] && ln -s dotfiles/$file .
done

# Launchpad
if [ $(uname) = Darwin ]; then 
	defaults write com.apple.dock springboard-columns -int 10;defaults write com.apple.dock springboard-rows -int 6;defaults write com.apple.dock ResetLaunchPad -bool TRUE;killall Dock
fi
