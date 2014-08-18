# .bashrc
#-----------------------------------------
#
# User specific aliases and functions
#
#-----------------------------------------
################
### [ echo ] ###
################
echo "read ~/bashrc"

########################
### [ Source Othor ] ###
########################
## Source global definitions
if [ -f /etc/bashrc ]; then
	source /etc/bashrc
fi

## Source path
#source ~/.cshrc

## Source local definitions
if [ -f ~/.bash_local ]; then
	source ~/.bash_local
fi

####################
### [ Set Path ] ###
####################
#export PATH="$HOME/local/bin:$HOME/local/sbin:$PATH"

###################
### [ Set Man ] ###
###################
export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH

#####################
### [ Set Pager ] ###
#####################






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
### [ Set Alias ] ###
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

# end of file
