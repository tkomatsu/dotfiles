all: $$HOME/dotfiles brew
	@/bin/zsh install.sh

.PHONY: brew
brew:
	@echo "installing Homebrew ..."
	@which brew >/dev/null 2>&1 || /bin/bash -c "$(shell curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

$$HOME/dotfiles:
	cd $$HOME

42:
	@mkdir -p ~/.vim/plugin
	@cp -r stdheader.vim ~/.vim/plugin/
