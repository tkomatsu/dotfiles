LANG=en_US.UTF-8

function norminette() {
	docker run --rm -v $PWD:/code alexandregv/norminette:v3 /code/$1
}

source ~/.bashrc.local
