all: $$HOME/dotfiles
	@/bin/zsh install.sh
	@make 42
	@echo "if you want to install Inconsolate fonts, exec below command."
	@echo "wget https://github.com/google/fonts/blob/master/ofl/inconsolata/Inconsolata%5Bwdth%2Cwght%5D.ttf"

$$HOME/dotfiles:
	cd $$HOME

42:
	@/bin/zsh install-42.sh
