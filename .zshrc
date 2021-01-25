#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|

export USER=tkomatsu
export MAIL=$USER@student.42tokyo.jp
export DOTFILES=$HOME/dotfiles
export STARSHIP_CONFIG=$DOTFILES/starship/starship.toml

eval "$(anyenv init -)"
eval "$(starship init zsh)"

autoload -Uz colors && colors

source $DOTFILES/.zshrc.xenv
source $DOTFILES/.zshrc.alias
source $DOTFILES/.zshrc.completion

setopt ignore_eof
setopt hist_ignore_all_dups
setopt auto_cd

# Added by c_formatter_42
export PATH="$PATH:/Users/tkomatsu/c_formatter_42"
