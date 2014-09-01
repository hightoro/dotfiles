# .bashrc
#-----------------------------------------
#
# User specific aliases and functions
#
#-----------------------------------------
################
### [ echo ] ###
################
echo "read ~/.bashrc"

#########################################################################
#
#  [ ログインシェルで実行されるスクリプト ]
#
#   1. /etc/profile
#   2.（以下のスクリプトファイルは、上からの優先順位でひとつだけ実行されます）
#      ~/.bash_profile
#      ~/.bash_login
#      ~/.profile
#  (3. 大抵の場合は~/.bash_profileに~/.bashrcを読み込む記述が存在する)
#
#
#  [ ログインシェル以外の対話シェル(インタラクティブシェル)で実行されるスクリプト ]
#
#   1. ~/.bashrc
#
#
# [ 非対話シェルで実行されるスクリプト ]
#
#   1. BASH_ENV　環境変数に指定されたファイル
#
#
#########################################################################


#####################################
### [ export environment values ] ###
#####################################
export BASH_DIR="$HOME/.dotfiles/.bash.d"
export BASH_ENV="$BASH_DIR/.bashenv"


########################
### [ Source Othor ] ###
########################
## Source global definitions
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

## Source environment definitions
#if [ -f $BASH_ENV ]; then
#    source $BASH_ENV
#fi

## Source main .basihrc
if [ -f $BASH_DIR/.bashrc ]; then
    source $BASH_DIR/.bashrc
fi


# end_of_file
