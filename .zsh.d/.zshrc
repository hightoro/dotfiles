#!/usr/bin/zsh

################
### [ echo ] ###
################
echo "read ZDOTDIR/.zshrc"


#########################
### [ Expend Prompt ] ###
#########################
## color 有効
autoload -Uz colors; colors
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
#   %M     ホスト名(FQDN) 
#   %m     ホスト名(サブドメイン) 
#   %n     ユーザー名 
#   %y     端末名
#   %l     端末名省略形
#   %#     rootなら#、他は%を表示 
#   %?     直前に実行したコマンドの結果コード 
#   %d     カレントディレクトリ(フルパス)(%/ でも可) 
#   %~     カレントディレクトリ(ホームディレクトリからのパス)
#   %C     カレントディレクトリ(ディレクトリ名のみ)
#   %c     カレントディレクトリ(ディレクトリ名のみ ${HOME}=${PWD}のとき~)(%. でも可)
#   %h     ヒストリ番号 (%! でも可) 
#   %a     The observed action, i.e. "logged on" or "logged off". 
#   %S     (%s) 反転モードの開始/終了 %S abc %s とするとabcが反転 
#   %U     (%u) 下線モードの開始/終了 %U abc %u とするとabcに下線 
#   %B     (%b) 強調モードの開始/終了 %B abc %b とするとabcを強調 
#   %t     時刻表示(12時間単位、午前/午後つき) (%@ でも可) 
#   %T     時刻表示(24時間表示) 
#   %*     時刻表示(24時間表示秒付き) 
#   %w     日表示(day dd) 日本語だと 曜日 日 
#   %W     年月日表示(mm/dd/yy) 
#   %D     年月日表示(yy-mm-dd)
#   %E     終了でのクリア
#   %F     文字の色(%fで終了)
#   %K     文字背景の色(%kで終了)
#
##########################################################

# 色の定義
local DEFAULT="%{[0m%}"
local RESET="%{${reset_color}%}"
local GREEN="%{${fg[green]}%}"
local BLUE="%{${fg[blue]}%}"
local RED="%{${fg[red]}%}"
local CYAN="%{${fg[cyan]}%}"
local YELLOW="%{${fg[yellow]}%}"
local MAGENTA="%{${fg[magenta]}%}"
local WHITE="%{${fg[white]}%}"

## (Now) ##
case ${UID} in
0)
    ## rootユーザの場合
    PROMPT="%B%U${RED}%n${DEFAULT}%u%b@%U${WHITE}%m%u${DEFAULT}]%(?.#.%F{red}#%f) ${RESET}"
    PROMPT2="%{$fg[magenta]%}%_%{$reset_color%}%{$fg_bold[white]%}>>%{$reset_color%} "
    RPROMPT="%B${WHITE}%b[${RESET}${CYAN}%~${RESET}%B${white}%b]${RESET}"
    SPROMPT="%{$fg_bold[red]%}correct%{$reset_color%}: %R -> %r ? "

    ## rootユーザー且つリモート接続の場合
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
      PROMPT="%B%U${MAGENTA}%n${DEFAULT}%u%b@%U${WHITE}%m%u${DEFAULT}]%(?.#.%F{red}#%f) ${RESET}"
    ;;
*)
    ## 一般ユーザの場合
    PROMPT="%B${GREEN}%n${DEFAULT}%b@%U${WHITE}%m%u${DEFAULT}]%(?.$.%F{red}$%f) ${RESET}"
    PROMPT2="%{$fg[magenta]%}%_%{$reset_color%}%{$fg_bold[white]%}>>%{$reset_color%} "
    RPROMPT="[%B${BLUE}%~${WHITE}%b]${RESET}"
    SPROMPT="%{$fg_bold[red]%}correct%{$reset_color%}: %R -> %r ? "

    ## 一般ユーザの且つリモート接続の場合
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
      PROMPT="%B${CYAN}%n${DEFAULT}%b@%U${WHITE}%m%u${DEFAULT}]%(?.$.%F{red}$%f) ${RESET}"
    ;;
esac

autoload -Uz is-at-least
if is-at-least 4.3.10; then
## Vcs-Info ##---------------------------------##

## (Git) ##
autoload -Uz vcs_info
# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'

precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

fi ##-----------------------------------------------##

###########################
### [ Expend Terminal ] ###
###########################
# 特定のターミナルでタイトルにユーザ名とホスト名とカレントディレクトリを表示。
case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac


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


################################
### [ Expend List segments ] ###
################################
## lsの色をcolor変更する
##########################################################
#
#   [ ls --color ] option (GNU)
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
# 色の設定(BSD版ls)
export LSCOLORS=Exfxcxdxbxegedabagacad
# 色の設定(GNU版ls)
export LS_COLORS='di=01;31:ln=01;35:so=32:pi=33:ex=01;32:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
#export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.sh=01;32:*.csh=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.rpm=01;31:*.cpio=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:'
if [ -f ${ZDOTDIR}/.zsh_plugin/dircolors-solarized/dircolors.ansi-universal ]; then
    eval $(dircolors ${ZDOTDIR}/.zsh_plugin/dircolors-solarized/dircolors.ansi-universal)
fi
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true

case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -GF"
  ;;
linux*)
  alias ls="ls -F --color"
  alias dir="ls -F --color"
  alias vdir="ls -F --color"
  ;;
cygwin)
  #alias ls="ls -F --color=auto"
  alias ls="ls -I'NTUSER.DAT*' -I'ntuser*' -F --color=auto"
  ;;
esac


###################################
### [ Expend Change Directory ] ###
###################################
## ディレクトリ名だけでcdする。
#setopt auto_cd
## cdで移動してもpushdと同じようにディレクトリスタックに追加する。
setopt auto_pushd
## pushd を引数無しで実行した時に pushd ~ とする。
setopt pushd_to_home
## pushdで同じディレクトリを重複してpushしない。
setopt pushd_ignore_dups
## リンクへ移動するとき実際のディレクトリへ移動
setopt chase_links
#cd後自動でls
function chpwd() { ls -v -F --color=auto }


#######################
### [ Expend Jobs ] ###
#######################
# バックグランドのジョブのスピードを落とさない
setopt NOBGNICE
# ログアウトしてもバックグランドジョブを続ける
setopt NOHUP



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
# rootは履歴を残さないようにする
if [ $UID = 0 ]; then
  unset HISTFILE
  SAVEHIST=0
fi

#############################
### [ Expend Completion ] ###
#############################
## completion 有効
autoload -U compinit
compinit

## カレントディレクトリ中に指定されたディレクトリが見つからなかった場合に
## 移動先を検索するリスト。
cdpath=(~)
## ディレクトリが変わったらディレクトリスタックを表示。
chpwd_functions=($chpwd_functions dirs)

##########################################################
# zstyle ":completion:*:*:コマンド:*:タグ" #####
##########################################################

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

## format
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'

zstyle ':completion:*' group-name ''

## 保管候補の選択方式
zstyle ':completion:*:default' menu select=2

## 補完候補を色付きで表示
#zstyle ':completion:*:default' list-colors ""
#zstyle ':completion:*:default' list-colors ${LS_COLORS}
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'
## 補完候補をキャッシュする。
zstyle ':completion:*' use-cache yes
## 詳細な情報を使う。
zstyle ':completion:*' verbose yes
## sudo時にはsudo用のパスも使う。
zstyle ':completion:sudo:*' environ PATH="$SUDO_PATH:$PATH"
## 色付き表示。
#zstyle ':completion:*' list-colors ''
# manの補完をセクション番号別に表示させる
zstyle ':completion:*:manuals' separate-sections true
# 変数の添字を補完する
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
## カレントディレクトリに候補がない場合のみ cdpath 上のディレクトリを候補に出す
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
## cdは親ディレクトリからカレントディレクトリを選択しないので表示させないようにする (例: cd ../<TAB>):
zstyle ':completion:*:cd:*' ignore-parents parent pwd
## オブジェクトファイルとか中間ファイルは補完候補にしない。でも rm では候補にする。
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.d' '*?.aux' '*?~' '*\#'
# kill 候補を色付け
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'


## カーソル位置で補完する。
setopt complete_in_word
## 補完時にヒストリを自動的に展開する。
setopt hist_expand
## 補完候補がないときなどにビープ音を鳴らさない。
setopt no_beep
## 辞書順ではなく数字順に並べる。
setopt numeric_glob_sort
# 補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
setopt list_types
# 補完候補リストを詰めて表示
#setopt list_packed
## globを展開しないで候補の一覧から補完する。
setopt glob_complete
## 明確なドットの指定なしで.から始まるファイルをマッチ
setopt globdots
## ファイル名のマッチングを強化 (`man zshexpn` の FILENAME GENERATION を参照)
setopt extended_glob
## コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments
## コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst
## alias でも(展開して)補完する
setopt complete_aliases


########################
### [ Other Option ] ###
########################
## 誤字の簡易訂正
setopt CORRECT_ALL
## rm * を実行する前に確認される。
setopt rmstar_wait
## ^Dでログアウトしないようにする。
setopt ignore_eof
## 単語の一部として扱われる文字のセットを指定する
## ここではデフォルトのセットから / を抜いたものとする
## こうすると、 Ctrl-W でカーソル前の1単語を削除したとき、 / までで削除が止まる
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
## 実行したプロセスの消費時間が3秒以上かかったら
## 自動的に消費時間の統計情報を表示する。
REPORTTIME=3


#####################
### [ Set Alias ] ###
#####################
#---[ unix cmd ]---#
alias l='ls -lha'
alias ll='ls -lh'
alias la='ls -a'
alias cp='nocorrect cp -i'
alias hi='history 50'
alias mv='nocorrect mv -i'
alias p='pwd'
alias rr="command rm -rf"
alias rm='rm -i'
alias mkdir='nocorrect mkdir'
alias touch='nocorrect touch'
alias pd="pushd"
alias po="popd"
alias color='perl ~/.zsh.d/color.pl'
alias g++0x='g++ -std=c++0x -Wall -Wextra'
alias g++11='g++ -std=c++11 -Wall -Wextra'

#---[ global option ]--#
alias -g G='| grep '
alias -g L='| less'

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

#================================
# alias resource
#================================
function resource {
    #source ${HOME}/.zshenv
    source ${ZDOTDIR}/.zshenv
    source ${ZDOTDIR}/.zshrc
}
#================================
# alias disp & x
#================================
#if [ -x $DISPLAY ]; then
#    export DISPLAY=localhost:10.0
#fi
#if [ -n $DISPLAY ]; then
#    export DISPLAY=localhost:0.0
#fi
function disp {
    export DISPLAY=localhost:$1.0
    echo "export DISPLAY=localhost:$1.0" > ${ZDOTDIR}/.zsh_disp
}
alias x='xauth list'
#================================
# alias e (emacs & emacsclient)
#================================
#function e(){
#    (echo "[$0] emacsclient -n $*"; emacsclient -n $* ) || (echo "[$0] emacs $* &"; emacs $* &)
#}
#function e(){
#    (echo "[$0] emacsclient -n $*"; emacsclient -n $* ) \
#        || (echo "[$0] emacsclient -n -c -a \"\" $*"; emacsclient -n -c -a "" $* )
#}

alias  ew='echo "[$0] emacsclient -n $*"; emacsclient -n $* '
alias ecw='echo "[$0] emacsclient -n -c -a \"\" $*"; emacsclient -n -c -a "" $* '
alias enw='echo "[$0] emacsclient -t -a \"\" $*"; emacsclient -t -a "" $* '
alias  ee='echo "[$0] emacsclient -e \"(kill-emacs)\""; emacsclient -e "(kill-emacs)"'
alias  er='echo "[$0] "; ee; ecw'
#alias emacs='echo "[$0] emacsclient -n -c -a \"\" $*"; emacsclient -n -c -a "" $* '

function e(){
    xprop -name emacs >/dev/null
    #echo $?
    if [ "$?" != "1" ] ;then
        #(echo "[$0] emacsclient -n $*"; emacsclient -n $* )
        # echo "exist frame"
        ew
    else
        #(echo "[$0] emacsclient -n -c -a \"\" $*"; emacsclient -n -c -a "" $* )
        # echo "not exist frame"
        ecw
    fi
}
########################
### [ load Plugin ] ###
########################
autoload -Uz is-at-least
###########################################
if is-at-least 5.0.0; then ##---------------------------------##
###########################################
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

if [ -f ${ZDOTDIR}/.zsh_plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source  ${ZDOTDIR}/.zsh_plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
###########################################
fi ##--------------------------------------------------------------##
###########################################


#================================
# source $HOME/.rbenv init -
#================================
#if [ -f ~/.rbenv/completions/rbenv.zsh ]; then
# eval "$(rbenv init -)"
# source ~/.rbenv/completions/rbenv.zsh
#fi

#================================
# source $HOME/.rvm/scripts/rvm
#================================


#####################
### [ Set tmux ] ###
#####################
if [ -z $TMUX ]; then
  if [ $UID -eq 0 ]; then
    ;
  elif $(tmux has-session); then
    tmux -2 attach
  else
    tmux -2
  fi
fi

#########################
### [ Read zsh_disp ] ###
#########################
if [ -f ${ZDOTDIR}/.zsh_disp ]; then
    echo "read ZDOTDIR/.zsh_disp"
    source  ${ZDOTDIR}/.zsh_disp
fi

echo "![ load complete ]!"
### end of file


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
