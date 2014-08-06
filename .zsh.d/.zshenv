#! zsh
################
### [ echo ] ###
################
echo "read ZDOTDIR/.zshenv"

################################################################
#
#  ## [ zsh起動時に設定ファイルが読まれる順番 ]
#  1: /etc/zshenv
#  2: ~/.zshenv
#  3: /etc/zprofile もしログインシェルなら
#  4: ~/.zprofile もしログインシェルなら
#  5: /etc/zshrc もし対話的シェルなら
#  6: ~/.zshrc もし対話的シェルなら
#  7: /etc/zlogin もしログインシェルなら
#  8: ~/.zlogin もしログインシェルなら
#
#  ## [ ログアウト時 ] ##
#  1: ~/.zlogout
#  2: /etc/zlogout
#
################################################################

####################
### [ Set Lang ] ###
####################
export LANG=ja_JP.UTF-8
#export LANG=ja_JP.eucJP

####################
### [ Set Path ] ###
####################
## -U: 重複したパスを登録しない。
typeset -U path
###############################################################
#
#       (N-/) :  存在しないディレクトリは登録しない。
#   パス(...) :  ...という条件にマッチするパスのみ残す。
#          N  :  NULL_GLOBオプションを設定。
#                globがマッチしなかったり存在しないパスを無視する。
#          -  :  シンボリックリンク先のパスを評価。
#          /  :  ディレクトリのみ残す。
#
###############################################################
path=(
    /bin(N-/)
    /usr/bin(N-/)
    /usr/local/bin(N-/)
    $HOME/local/bin(N-/))


#########################
### [ Set Sudo-Path ] ###
#########################
## -x: export SUDO_PATHも一緒に行う。
## -T: SUDO_PATHとsudo_pathを連動する。
## -U: 重複したパスを登録しない。
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=(
    {,/usr/pkg,/usr/local,/usr}/sbin(N-/))


###################
### [ Set Man ] ###
###################
## -U: 重複したパスを登録しない。
typeset -U manpath
manpath=(
    # 自分用
    $HOME/local/share/man(N-/)
    # MacPorts用
    /opt/local/share/man(N-/)
    # システム用
    /usr/local/share/man(N-/)
    /usr/share/man(N-/))


#####################
### [ Set Pager ] ###
#####################
## lvを優先し、なかったらlessを使う。
if type lv > /dev/null 2>&1; then
    export PAGER="lv"
else
    export PAGER="less"
fi

###############################################################
#
#   -c: ANSIエスケープシーケンスの色付けなどを有効にする。
#   -l: 1行が長くと折り返されていても1行として扱う。
#       （コピーしたときに余計な改行を入れない。）
#
###############################################################
## lv のデフォルトオプション
if [ "$PAGER" = "lv" ]; then
    export LV="-c -l"
else
    ## lvがなくてもlvでページャーを起動する。
    alias lv="$PAGER"
fi

## less のデフォルトオプション
export LESS='--max-back-scroll=1000 --ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS'


#####################
### [ Set Grep ] ###
#####################
## GNU grepがあったら優先して使う。
if type ggrep > /dev/null 2>&1; then
    alias grep=ggrep
fi
## デフォルトオプションの設定
export GREP_OPTIONS
### バイナリファイルにはマッチさせない。
GREP_OPTIONS="--binary-files=without-match"
### grep対象としてディレクトリを指定したらディレクトリ内を再帰的にgrepする。
#GREP_OPTIONS="--directories=recurse $GREP_OPTIONS"
GREP_OPTIONS="--recursive $GREP_OPTIONS"
### 拡張子が.tmpのファイルは無視する。
GREP_OPTIONS="--exclude=\*.tmp $GREP_OPTIONS"

## 管理用ディレクトリを無視する。
if grep --help | grep -q -- --exclude-dir
then
  for ext (.svn .git .hg .deps .libs)
  do
    GREP_OPTIONS="--exclude-dir=$ext $GREP_OPTIONS"
  done
fi
#then
#    GREP_OPTIONS="--exclude-dir=.svn $GREP_OPTIONS"
#    GREP_OPTIONS="--exclude-dir=.git $GREP_OPTIONS"
#    GREP_OPTIONS="--exclude-dir=.deps $GREP_OPTIONS"
#    GREP_OPTIONS="--exclude-dir=.libs $GREP_OPTIONS"
#fi

### 可能なら色を付ける。
if grep --help | grep -q -- --color
then
    GREP_OPTIONS="--color=auto $GREP_OPTIONS"
fi

######################
### [ Set Editor ] ###
######################
## vimを使う。
#export EDITOR=emacsclient -a emacs
export EDITOR=vim
## vimがなくてもvimでviを起動する。
if ! type vim > /dev/null 2>&1; then
    alias vim=vi
fi


###################
### [ Set Lib ] ###
###################
[ -z "$ld_library" ]    && typeset -xT LD_LIBRARY_PATH    ld_library
[ -z "$ld_run" ]        && typeset -xT LD_RUN_PATH        ld_run
[ -z "$cplus_include" ] && typeset -xT CPLUS_INCLUDE_PATH cplus_include
[ -z "$c_include" ]     && typeset -xT C_INCLUDE_PATH     c_include
typeset -U ld_library_path cplus_include c_include

## LD_LIBRARY_PATH
ld_library=(
    $HOME/local/lib64(N-/)
    $HOME/local/lib(N-/)
    /usr/local/lib64(N-/)
    /usr/local/lib(N-/)
    /usr/lib64(N-/)
    /usr/lib(N-/)
    /lib64(N-/)
    /lib(N-/)
)
#export LD_LIBRARY_PATH=/lib:$LD_LIBRARY_PATH:
#export LD_LIBRARY_PATH=/lib64:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/usr/lib:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/usr/lib64:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/usr/local/lib64:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=$HOME/local/lib64:$LD_LIBRARY_PATH

## LD_RUN_PATH
ld_run=(
    $HOME/local/lib64(N-/)
    $HOME/local/lib(N-/)
    /usr/local/lib64(N-/)
    /usr/local/lib(N-/)
    /usr/lib64(N-/)
    /usr/lib(N-/)
    /lib64(N-/)
    /lib(N-/)
)

## C++ (CPLUS_INCLUDE_PATH) ##
cplus_include=(
    $HOME/local/include(N-/)
    /usr/local/include(N-/)
    /usr/include(N-/)
)
#export CPLUS_INCLUDE_PATH=/usr/include:$CPLUS_INCLUDE_PATH
#export CPULS_INCLUDE_PATH=/usr/local/include:$CPLUS_INCLUDE_PATH
#export CPLUS_INCLUDE_PATH=$HOME/local/include:$CPLUS_INCLUDE_PATH

## C (C_INCLUDE_PATH) ##
c_include=(
    $HOME/local/include(N-/)
    /usr/local/include(N-/)
    /usr/include(N-/)
)
#export C_INCLUDE_PATH=/usr/include/:$C_INCLUDE_PATH
#export C_INCLUDE_PATH=/usr/local/include:$C_INCLUDE_PATH
#export C_INCLUDE_PATH=$HOME/local/include:$C_INCLUDE_PATH

## Perl ##

## Ruby ##

## Python ##

###################
### [ Set Lib ] ###
###################



if [ -f ${ZDOTDIR}/.zsh_local ]; then
    source ${ZDOTDIR}/.zsh_local
fi


### end of file
