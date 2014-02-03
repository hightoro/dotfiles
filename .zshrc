source $HOME/.zsh.d/zshrc

# It should contain commands to set up aliases,
# functions, options, key bindings, etc.

#export DISPLAY=localhost:14.0
#xauth remove unix:10

#alias emacs="$HOME/local/bin/emacs-23.1"
#alias vim="$HOME/local/bin/vim"
#alias gvim="$HOME/local/bin/gvim"
#alias g++="$HOME/local/bin/g++"

#---[ tmux ]---#
if [ -z $TMUX ]; then
  if $(tmux has-session); then
    tmux attach
    #tmux
  else
    #tmux
  fi
fi


