all: $$HOME/dotfiles
	/bin/bash install.sh
	make brew
	make vim

$$HOME/dotfiles:
	cd $$HOME

vim:
	/bin/bash install-vim.sh

brew:
	/bin/bash install-brew.sh
