LANG=en_US.UTF-8

function norminette() {
	docker run --rm -v $PWD:/code tkomatsu/norminette /code/$1
}

export PS1='\[\033[01;32m\]\u@\H\[\033[01;34m\] \w \$\[\033[00m\] '

source ~/.bashrc.local
