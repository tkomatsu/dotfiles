all: $$HOME/dotfiles
	@/bin/zsh install.sh
	@make brew
	@make vim
	@make 42
	@echo "if you want to install Inconsolate fonts, exec below command."
	@echo "wget https://github.com/google/fonts/blob/master/ofl/inconsolata/Inconsolata%5Bwdth%2Cwght%5D.ttf"

$$HOME/dotfiles:
	cd $$HOME

vim:
	@/bin/zsh install-vim.sh

brew:
	@/bin/zsh install-brew.sh

42:
	@/bin/zsh install-42.sh
