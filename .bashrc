LANG=en_US.UTF-8

function norminette() {
	docker run --rm -v $PWD:/code tkomatsu/norminette /code/$1
}

source ~/.bashrc.local
