#! zsh

################
### [ echo ] ###
################
echo "read ZDOTDIR/.zshenv"

####################
### [ Set Path ] ###
####################
## 重複したパスを登録しない。
typeset -U path
###############################################################
#
#  (N-/): 存在しないディレクトリは登録しない。
#     パス(...): ...という条件にマッチするパスのみ残す。
#             N: NULL_GLOBオプションを設定。
#                globがマッチしなかったり存在しないパスを無視する。
#             -: シンボリックリンク先のパスを評価。
#             /: ディレクトリのみ残す。
#
###############################################################
path=(
    /bin(N-/)
    /usr/bin(N-/)
    /usr/local/bin(N-/)
    $HOME/local/bin(N-/)
)

####################
### [ Set Lang ] ###
####################
export LANG=ja_JP.UTF-8 
#export LANG=ja_JP.eucJP

###################
### [ Set Lib ] ###
###################
[ -z "$ld_library" ] &&    typeset -xT LD_LIBRARY_PATH    ld_library
[ -z "$ld_run" ] &&        typeset -xT LD_RUN_PATH        ld_run
[ -z "$cplus_include" ] && typeset -xT CPLUS_INCLUDE_PATH cplus_include
[ -z "$c_include" ] &&     typeset -xT C_INCLUDE_PATH     c_include
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




### end of file
