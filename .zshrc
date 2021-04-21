#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|

export MAIL=$USER@student.42tokyo.jp
export DOTFILES=$HOME/dotfiles
export STARSHIP_CONFIG=$DOTFILES/starship/starship.toml

eval "$(starship init zsh)"

autoload -Uz colors && colors

source $DOTFILES/.zshrc.xenv
source $DOTFILES/.zshrc.alias
source $DOTFILES/.zshrc.completion
source $HOME/.zshrc.local

setopt ignore_eof
setopt hist_ignore_all_dups
setopt share_history
setopt auto_cd
cdpath=(~/Documents/42)

export PATH="/usr/local/sbin:$PATH"
export LANG=en_US.UTF-8

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
