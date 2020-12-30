RUBYVER := 2.6.3

all: $$HOME/dotfiles
	@/bin/bash install.sh
	@make brew
	@make vim

$$HOME/dotfiles:
	@cd $$HOME

vim:
	@/bin/bash install-vim.sh

brew:
	@/bin/bash install-brew.sh

ruby:
	rbenv install $(RUBYVER)
	rbenv global $(RUBYVER)
