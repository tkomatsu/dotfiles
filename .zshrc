export USER=tkomatsu
export MAIL=$USER@student.42tokyo.jp
alias norminette="~/.norminette/norminette.rb"
alias gccW="gcc -Werror -Wall -Wextra"
export PYENV_ROOT=/usr/local/var/pyenv
if
	which pyenv > /dev/null;
	then eval "$(pyenv init -)";
fi
# 色を使用出来るようにする
autoload -Uz colors
colors

# プロンプト
# 2行表示
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
\$ "

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


########################################
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg


########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd

# 重複したディレクトリを追加しない
# setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
# setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

# ビープ音を鳴らさないようにする
setopt no_beep

########################################
# キーバインド

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
# bindkey '^R' history-incremental-pattern-search-backward

########################################
# エイリアス

alias l='ls'
alias la='ls -a'
alias ll='ls -l'

#alias rm='rm -i'
#alias cp='cp -i'
#alias mv='mv -i'

alias mkdir='mkdir -p'
alias d='cd ~/Documents'
alias 42='cd ~/Documents/42'
alias ..='cd ..'
alias ls='ls -G'

#alias vim ='/usr/local/bin/vim'
# sudo の後のコマンドでエイリアスを有効にする
#alias sudo='sudo '

# グローバルエイリアス
#alias -g L='| less'
#alias -g G='| grep'

export PATH="$HOME/.nodebrew/current/bin:/usr/local/sbin:$PATH"
eval "$(gh completion -s zsh)"
