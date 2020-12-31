#!/bin/bash

THIS_DIR=$(cd $(dirname $0); pwd)

# Norminette
cd $THIS_DIR
git clone https://github.com/42Paris/norminette.git ~/.norminette/
cd ~/.norminette/
bundle

# 42 header
cd $HOME
mkdir ~/.vim/plugin
cp dotfiles/stdheader.vim ~/.vim/plugin/

# minilibx-linux
if [ $(uname) = Linux ]; then 
	sudo apt-get install gcc make xorg libxext-dev libbsd-dev
	cd $HOME/dotfiles/minilibx-linux
	make 
	cp libmlx.a /usr/local/lib/libmlx.a
	cp libmlx_$(HOSTNAME).a /usr/local/lib/libmlx_$(HOSTNAME).a
	cp mlx.h /usr/local/include
	cp man/man3/mlx*.1 /usr/local/man/man3
fi
