# .zsh.d/zshrc

#set   ZSHDIR=${HOME}/.zsh.d
source ${HOME}/.zshenv

################
### [ echo ] ###
################
#echo "read my_zsh_dir/zshrc"

###################
### [ Display ] ###
###################
if [ -n $DISPLAY ]; then
#export DISPLAY=localhost:0.0
fi

#########################
### [ Expend Prompt ] ###
#########################
## color 有効
autoload -Uz colors
colors

##########################################################
#
# [ 色一覧 ] 
#   00:    なにもしない
#   01:    太字化
#   04:    下線
#   05:    点滅 
#   07:    前背色反転 
#   08:    表示しない 
#   22:    ノーマル化 
#   24:    下線なし 
#   25:    点滅なし 
#   27:    前背色反転なし 
#   30:    黒(前景色) 
#   31:    赤(前景色) 
#   32:    緑(前景色) 
#   33:    茶(前景色) 
#   34:    青(前景色) 
#   35:    マゼンタ(前景色) 
#   36:    シアン(前景色) 
#   37:    白(前景色) 
#   39:    デフォルト(前景色) 
#   40:    黒(背景色) 
#   41:    赤(背景色) 
#   42:    緑(背景色) 
#   43:    茶(背景色) 
#   44:    青(背景色) 
#   45:    マゼンタ(背景色) 
#   46:    シアン(背景色) 
#   47:    白(背景色) 
#   49:    デフォルト(背景色)
#
# [ プロンプト表示フォーマット ]
#   %%     %を表示
#   %)     )を表示
#   %l     端末名省略形 
#   %M     ホスト名(FQDN) 
#   %m     ホスト名(サブドメイン) 
#   %n     ユーザー名 
#   %y     端末名 
#   %#     rootなら#、他は%を表示 
#   %?     直前に実行したコマンドの結果コード 
#   %d     ワーキングディレクトリ %/ でも可 
#   %~     ホームディレクトリからのパス 
#   %h     ヒストリ番号 %! でも可 
#   %a     The observed action, i.e. "logged on" or "logged off". 
#   %S     (%s) 反転モードの開始/終了 %S abc %s とするとabcが反転 
#   %U     (%u) 下線モードの開始/終了 %U abc %u とするとabcに下線 
#   %B     (%b) 強調モードの開始/終了 %B abc %b とするとabcを強調 
#   %t     時刻表示(12時間単位、午前/午後つき) %@ でも可 
#   %T     時刻表示(24時間表示) 
#   %*     時刻表示(24時間表示秒付き) 
#   %w     日表示(dd) 日本語だと 曜日 日 
#   %W     年月日表示(mm/dd/yy) 
#   %D     年月日表示(yy-mm-dd)
#   %E     終了でのクリア
#   %F     文字の色(%fで終了)
#   %K     文字背景の色(%kで終了)
#
##########################################################

# 色の定義
DEFAULT="%{[0m%}"
RESET="%{${reset_color}%}"
GREEN="%{${fg[green]}%}"
BLUE="%{${fg[blue]}%}"
RED="%{${fg[red]}%}"
CYAN="%{${fg[cyan]}%}"
YELLOW="%{${fg[yellow]}%}"
MAGENTA="%{${fg[magenta]}%}"
WHITE="%{${fg[white]}%}"

## (Now) ##
case ${UID} in
0)
    ## rootユーザの場合
    PROMPT="%{$fg_bold[green]%}%m%{$fg_bold[red]%}#%{$reset_color%} "
    PROMPT2="%{$fg[magenta]%}%_%{$reset_color%}%{$fg_bold[white]%}>>%{$reset_color%} "
    RPROMPT="%{$fg_bold[white]%}[%{$reset_color%}%{$fg[cyan]%}%~%{$reset_color%}%{$fg_bold[white]%}]%{$reset_color%}"
    SPROMPT="%{$fg_bold[red]%}correct%{$reset_color%}: %R -> %r ? "
    #[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    #    PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
*)
    ## 一般ユーザの場合
    PROMPT="%B${GREEN}%n${DEFAULT}%b@%U${BLUE}%m%u${DEFAULT}]$ ${RESET}"
    PROMPT2="%{$fg[magenta]%}%_%{$reset_color%}%{$fg_bold[white]%}>>%{$reset_color%} "
    RPROMPT="[%B${CYAN}%~${WHITE}%b]${RESET}"
    SPROMPT="%{$fg_bold[red]%}correct%{$reset_color%}: %R -> %r ? "
    #[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    #    PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
esac


## (First) ##
#case ${UID} in
#0)
#    PROMPT="%B%{[31m%}%/#%{[m%}%b "
#    PROMPT2="%B%{[31m%}%_#%{[m%}%b "
#    SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
#    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
#        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
#    ;;
#*)
#    PROMPT="%{[31m%}%/%%%{[m%} "
#    PROMPT2="%{[31m%}%_%%%{[m%} "
#    SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
#    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
#        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
#    ;;
#esac


## (Second) ##
#case ${UID} in
#0)
#    PROMPT="%{$fg_bold[green]%}%m%{$fg_bold[red]%}#%{$reset_color%} "
#    PROMPT2="%{$fg[magenta]%}%_%{$reset_color%}%{$fg_bold[white]%}>>%{$reset_color%} "
#    RPROMPT="%{$fg_bold[white]%}[%{$reset_color%}%{$fg[cyan]%}%~%{$reset_color%}%{$fg_bold[white]%}]%{$reset_color%}"
#    SPROMPT="%{$fg_bold[red]%}correct%{$reset_color%}: %R -> %r ? "
##    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
##        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
#    ;;
#*)
#    PROMPT="%{$fg_bold[cyan]%}%m%{$fg_bold[white]%}%%%{$reset_color%} "
#    PROMPT2="%{$fg[magenta]%}%_%{$reset_color%}%{$fg_bold[white]%}>>%{$reset_color%} "
#    RPROMPT="%{$fg_bold[white]%}[%{$reset_color%}%{$fg[cyan]%}%~%{$reset_color%}%{$fg_bold[white]%}]%{$reset_color%}"
#    SPROMPT="%{$fg_bold[red]%}correct%{$reset_color%}: %R -> %r ? "
##    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
#        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
#    ;;
#esac


# set terminal title including current directory
#case "${TERM}" in
#kterm*|xterm)
#    precmd() {
#        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
#    }
#    ;;
#esac

#update_prompt()
#{
    # プロンプトバーの左側の文字数を数える。
    # 左側では最後に実行したコマンドの終了ステータスを使っているのでこれは一番最初に実行しなければいけない。
    # そうしないと、最後に実行したコマンドの終了ステータスが消えてしまう。
#    local bar_left_length=$(count_prompt_characters "$prompt_bar_left")

    # プロンプトバーに使える残り文字を計算する。
    # $COLUMNSにはターミナルの横幅が入っている。
#    local bar_rest_length=$[COLUMNS - bar_left_length]


#    local bar_left="$prompt_bar_left"

    # パスに展開される「%d」を削除。
#    local bar_right_without_path="${prompt_bar_right:s/%d//}"

    # 「%d」を抜いた文字数を計算する。
#    local bar_right_without_path_length=$(count_prompt_characters "$bar_right_without_path")

    # パスの最大長を計算する。$[...]: 「...」を算術演算した結果で展開する。
#    local max_path_length=$[bar_rest_length - bar_right_without_path_length]

    # パスに展開される「%d」に最大文字数制限をつける。
    #   %d -> %(C,%${max_path_length}<...<%d%<<,)
    #     %(x,true-text,false-text):
    #         xが真のときはtrue-textになり偽のときはfalse-textになる。
    #         ここでは、「%N<...<%d%<<」の効果をこの範囲だけに限定させる
    #         ために用いているだけなので、xは必ず真になる条件を指定している。
    #       C: 現在の絶対パスが/以下にあると真。なので必ず真になる。
    #       %${max_path_length}<...<%d%<<:
    #          「%d」が「${max_path_length}」カラムより長かったら、
    #          長い分を削除して「...」にする。最終的に「...」も含めて
    #          「${max_path_length}」カラムより長くなることはない。
#    bar_right=${prompt_bar_right:s/%d/%(C,%${max_path_length}<...<%d%<<,)/}

    # 「${bar_rest_length}」文字分の「-」を作っている。
    # どうせ後で切り詰めるので十分に長い文字列を作っているだけ。
    # 文字数はざっくり。
#    local separator="${(l:${bar_rest_length}::-:)}"

    # プロンプトバー全体を「${bar_rest_length}」カラム分にする。
    #   %${bar_rest_length}<<...%<<:
    #     「...」を最大で「${bar_rest_length}」カラムにする。
#    bar_right="%${bar_rest_length}<<${separator}${bar_right}%<<"

    # プロンプトバーと左プロンプトを設定
    #   "${bar_left}${bar_right}": プロンプトバー
    #   $'\n': 改行
    #   "${prompt_left}": 2行目左のプロンプト
#    PROMPT="${bar_left}${bar_right}"$'\n'"${prompt_left}"

    # 右プロンプト
    #   %{%B%F{white}%K{green}}...%{%k%f%b%}:
    #       「...」を太字で緑背景の白文字にする。
    #   %~: カレントディレクトリのフルパス（可能なら「~」で省略する）
#    RPROMPT="[%{%B%F{white}%K{magenta}%}%~%{%k%f%b%}]"

    # バージョン管理システムの情報を取得する。
#    LANG=C vcs_info >&/dev/null

    # バージョン管理システムの情報があったら右プロンプトに表示する。
#    if [ -n "$vcs_info_msg_0_" ]; then
#        RPROMPT="${vcs_info_msg_0_}-${RPROMPT}"
#    fi

#}

## コマンド実行前に呼び出されるフック。
#precmd_functions=($precmd_functions update_prompt)


#########################
### [ Expend Window ] ###
#########################
## 実行中のコマンドとユーザ名とホスト名とカレントディレクトリを表示。
update_title() {
    local command_line=
    typeset -a command_line
    command_line=${(z)2}
    local command=
    if [ ${(t)command_line} = "array-local" ]; then
        command="$command_line[1]"
    else
        command="$2"
    fi
    print -n -P "\e]2;"
    echo -n "(${command})"
    print -n -P " %n@%m:%~\a"
}
## X環境上でだけウィンドウタイトルを変える。
if [ -n "$DISPLAY" ]; then
    preexec_functions=($preexec_functions update_title)
fi

## lsの色をcolor変更する
#export LSCOLORS=exfxcxdxbxegedabagacad
##########################################################
#
#   di: ディレクトリ
#   ln: シンボリックリンク
#   so: ソケットファイル
#   pi: FIFOファイル
#   ex: 実行ファイル
#   bd: ブロックスペシャルファイル
#   cd: キャラクタスペシャルファイル
#   su: setuidつき実行ファイル
#   sg: setgidつき実行ファイル
#   tw: スティッキビットありother書き込み権限つきディレクトリ
#   ow: スティッキビットなしother書き込み権限つきディレクトリ
#
#   #####################################################
#
#   00: なにもしない
#   01: 太字化
#   04: 下線
#   05: 点滅
#   07: 前背色反転
#   08: 表示しない
#   22: ノーマル化
#   24: 下線なし
#   25: 点滅なし
#   27: 前背色反転なし
#   30: 黒(前景色)
#   31: 赤(前景色)
#   32: 緑(前景色)
#   33: 茶(前景色)
#   34: 青(前景色)
#   35: マゼンタ(前景色)
#   36: シアン(前景色)
#   37: 白(前景色)
#   39: デフォルト(前景色)
#   40: 黒(背景色)
#   41: 赤(背景色)
#   42: 緑(背景色)
#   43: 茶(背景色)
#   44: 青(背景色)
#   45: マゼンタ(背景色)
#   46: シアン(背景色)
#   47: 白(背景色)
#   49: デフォルト(背景色)
#
########################################################
export LS_COLORS='di=01;31:ln=01;35:so=32:pi=33:ex=01;32:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
#export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.sh=01;32:*.csh=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.rpm=01;31:*.cpio=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:'
case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -GF"
  ;;
linux*)
  alias ls="ls -F --color"
  ;;
esac

###################################
### [ Expend Change directory ] ###
###################################
## ディレクトリ名だけでcdする。
setopt auto_cd
## cdで移動してもpushdと同じようにディレクトリスタックに追加する。
setopt auto_pushd
## カレントディレクトリ中に指定されたディレクトリが見つからなかった場合に
## 移動先を検索するリスト。
cdpath=(~)
## ディレクトリが変わったらディレクトリスタックを表示。
chpwd_functions=($chpwd_functions dirs)
## pushd を引数無しで実行した時に pushd ~ とする。
setopt pushd_to_home
## pushdで同じディレクトリを重複してpushしない。
setopt pushd_ignore_dups

##########################
### [ Expend History ] ###
##########################
## ヒストリを保存するファイル
HISTFILE=$HOME/.zsh.d/.zsh_history
## メモリ上のヒストリ数。
## 大きな数を指定してすべてのヒストリを保存するようにしている。
HISTSIZE=10000000
## 保存するヒストリ数
SAVEHIST=$HISTSIZE
## ヒストリファイルにコマンドラインだけではなく実行時刻と実行時間も保存する。
setopt extended_history
## 同一コマンドヒストリの場合に、古いものを削除
#setopt HIST_IGNORE_ALL_DUPS
## 同じコマンドラインを連続で実行した場合はヒストリに登録しない。
setopt hist_ignore_dups
## スペースで始まるコマンドラインはヒストリに追加しない。
setopt hist_ignore_space
## ヒストリ追加時に余白削除 
setopt HIST_REDUCE_BLANKS
## すぐにヒストリファイルに追記する。
setopt inc_append_history
## zshプロセス間でヒストリを共有する。
setopt share_history
## C-sでのヒストリ検索が潰されてしまうため、出力停止・開始用にC-s/C-qを使わない。
setopt no_flow_control

#############################
### [ Expend Completion ] ###
#############################
## completion 有効
autoload -U compinit
compinit

zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:default' list-colors ""
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'

##########################################################
#
#  補完方法の設定。指定した順番に実行する。
#   _oldlist 前回の補完結果を再利用する。
#   _complete: 補完する。
#   _match: globを展開しないで候補の一覧から補完する。
#   _history: ヒストリのコマンドも補完候補とする。
#   _ignored: 補完候補にださないと指定したものも補完候補とする。
#   _approximate: 似ている補完候補も補完候補とする。
#   _prefix: カーソル以降を無視してカーソル位置までで補完する。
#
##########################################################
zstyle ':completion:*' completer _oldlist _complete _match _history _ignored _approximate _prefix

## 補完候補をキャッシュする。
zstyle ':completion:*' use-cache yes
## 詳細な情報を使う。
zstyle ':completion:*' verbose yes
## sudo時にはsudo用のパスも使う。
zstyle ':completion:sudo:*' environ PATH="$SUDO_PATH:$PATH"
## 色付き表示。
zstyle ':completion:*' list-colors ''

## カーソル位置で補完する。
setopt complete_in_word
## globを展開しないで候補の一覧から補完する。
setopt glob_complete
## 補完時にヒストリを自動的に展開する。
setopt hist_expand
## 補完候補がないときなどにビープ音を鳴らさない。
setopt no_beep
## 辞書順ではなく数字順に並べる。
setopt numeric_glob_sort

########################
### [ Other Option ] ###
########################
## rm * を実行する前に確認される。
setopt rmstar_wait
## ^Dでログアウトしないようにする。
setopt ignore_eof
## 実行したプロセスの消費時間が3秒以上かかったら
## 自動的に消費時間の統計情報を表示する。
REPORTTIME=3

#####################
### [ Set Alias ] ###
#####################
#---[ cmd ]---#
alias l='ls -la'
alias ll='ls -l'
alias la='ls -a'
alias cp='cp -i'
alias hi='history 50'
alias mv='mv -i'
alias p='pwd'
alias rr="command rm -rf"
alias rm='rm -i'
alias pd="pushd"
alias po="popd"
alias color='perl ~/.zsh.d/color.pl'

#---[ xterm ]---#
alias xb='xterm -sb -bg black -fg white &'
alias xb1='xterm -sb -bg DimGray -fg white &' 
alias xb2='xterm -sb -bg gray62 -fg black &'
alias xb3='xterm -sb -bg gray42 -fg black &'
alias xw='xterm -sb -bg WhiteSmoke -fg black &'
alias xw1='xterm -sb -bg OldLace -fg black &'
alias xw2='xterm -sb -bg snow -fg black &'
alias xw3='xterm -sb -bg FloralWhite -fg black &'
alias xw4='xterm -sb -bg MintCream -fg black &'
alias xw5='xterm -sb -bg lavender -fg black &'
alias xw6='xterm -sb -bg LightPink -fg black &'
alias xw7='xterm -sb -bg AntiqueWhite1 -fg black &'
alias xw8='xterm -sb -bg NavajoWhite3 -fg black &'
alias xy='xterm -sb -bg LemonChiffon -fg black &'
alias xy1='xterm -sb -bg LightGoldenrod1 -fg black &'
alias xy2='xterm -sb -bg moccasin -fg black &'
alias xy3='xterm -sb -bg LightYellow -fg black &'
alias xy4='xterm -sb -bg LightGoldenrod -fg black &'
alias xy5='xterm -sb -bg cornsilk -fg black &'
alias xy6='xterm -sb -bg NavajoWhite -fg black &'
alias xg='xterm -sb -bg YellowGreen -fg black &'
alias xcollar='showrgb'

### end of file

