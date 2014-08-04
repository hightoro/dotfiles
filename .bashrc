# .bashrc

# User specific aliases and functions

# [ SOURCE ]
#source ~/.cshrc

# [ ALIAS ]
#---[ cmd ]---#
alias a='alias'
alias l='ls -al'
alias cp='cp -i'
alias hi='history 50'
alias mv='mv -i'
alias p='pwd'
alias rm='rm -i'
alias x='xauth list'

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

## 
function disp {
  export DISPLAY=localhost:$1.0
  echo "export DISPLAY=localhost:$1.0" >> ${HOME}/.bash_local
}

## Source global definitions
if [ -f ~/.bash_local ]; then
	source ~/.bash_local
fi

if [ -f /etc/bashrc ]; then
	source /etc/bashrc
fi

## tmux
if [ -z $TMUX ]; then
  if $(tmux has-session); then
    tmux -2 attach
  else
    tmux
  fi
fi
