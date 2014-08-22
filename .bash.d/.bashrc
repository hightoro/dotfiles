# .bashrc
#-----------------------------------------
#
# User specific aliases and functions
#
#-----------------------------------------
##############################
### [ Set bash Envirment file ] ###
##############################
export DOTBDIR=$HOME/.bash.d

if [ -f $DOTBDIR/.bashenv ]; then
    export BASH_ENV=$DOTBDIR/.bashenv
    source $BASH_ENV
fi

################
### [ echo ] ###
################
echo "read DOTBDIR/.bashrc"

########################
### [ Source disp ] ###
########################
## Display
if [ -f $DOTBDIR/.bash_disp ]; then
	source $DOTBDIR/.bash_disp
fi

######################
### [ Set prompt ] ###
######################
case ${UID} in
0)
    ## rootユーザの場合
    PS1="\[\e[01;31m\]\u\[\e[00;04;37m\]@\h\[\e[00;34m\] \w \$ \[\e[00m\]"

    ## rootユーザー且つリモート接続の場合
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
      PS1="\[\e[01;31m\]\u\[\e[00;04;37m\]@\h\[\e[00;34m\] \w \$ \[\e[00m\]"
    ;;
*)
    ## 一般ユーザの場合
    PS1="\[\e[01;32m\]\u\[\e[00;04;37m\]@\h\[\e[00;34m\] \w \$ \[\e[00m\]"

    ## 一般ユーザの且つリモート接続の場合
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PS1="\[\e[01;36m\]\u\[\e[00;04;37m\]@\h\[\e[00;34m\] \w \$ \[\e[00m\]"
    ;;
esac


#####################
### [ Set List  ] ###
#####################
if [ -f ~/.zsh.d/.zsh_plugin/dircolors-solarized/dircolors.ansi-universal ]; then
    eval $(dircolors ~/.zsh.d/.zsh_plugin/dircolors-solarized/dircolors.ansi-universal)
fi
alias ls='ls -F --color=auto'


#####################
## [ Set Alias ] ###
#####################
#---[ cmd ]---#
alias l='ls -al'
alias la='ls -a'
alias ll='ls -l'
alias cp='cp -i'
alias hi='history 50'
alias mv='mv -i'
alias p='pwd'
alias rm='rm -i'


#----------------------
#--- alias disp & x
#----------------------
function disp {
  export DISPLAY=localhost:$1.0
  echo "export DISPLAY=localhost:$1.0" >> ${HOME}/.bash_local
}
alias x='xauth list'


#####################
### [ call TMUX ] ###
#####################
## tmux
if [ -z $TMUX ]; then
  if $(tmux has-session); then
    tmux -2 attach
  else
    tmux -2
  fi
fi


#end-of-files
