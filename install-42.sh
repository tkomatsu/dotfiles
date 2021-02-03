#!/bin/zsh

THIS_DIR=$(cd $(dirname $0); pwd)

# Norminette
cd $THIS_DIR
git clone https://github.com/42Paris/norminette.git ~/.norminette/
cd ~/.norminette/
bundle

# 42 header
cd $HOME
cp -r dotfiles/stdheader.vim ~/.vim/plugin/

# minilibx-linux
if [ $(uname) = Linux ]; then 
	sudo apt-get install gcc make xorg libxext-dev libbsd-dev
	cd $HOME/dotfiles/minilibx-linux
	make 
	cp -r libmlx.a /usr/local/lib/libmlx.a
	cp -r libmlx_$(HOSTNAME).a /usr/local/lib/libmlx_$(HOSTNAME).a
	cp -r mlx.h /usr/local/include
	cp -r man/man3/mlx*.1 /usr/local/man/man3
fi
