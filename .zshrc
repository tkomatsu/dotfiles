#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|

export USER=tkomatsu
export MAIL=$USER@student.42tokyo.jp
export DOTFILES=$HOME/dotfiles

eval "$(anyenv init -)"

source $DOTFILES/.zshrc.xenv
source $DOTFILES/.zshrc.alias
source $DOTFILES/.zshrc.prompt
source $DOTFILES/.zshrc.completion

# 色を使用出来るようにする
autoload -Uz colors && colors

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob
