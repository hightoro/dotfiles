# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup program
PATH=$PATH:$HOME/bin

export PATH
unset USERNAME

####################
### [ Set Path ] ###
####################
#export PATH="$HOME/local/bin:$HOME/local/sbin:$PATH"

####################
### [ Set INCLUDE ] ###
####################
#export CPLUS_INCLUDE_PATH=$HOME/local/include:$CPLUS_INCLUDE_PATH
#export CPLUS_INCLUDE_PATH=$HOME/local/include/ncurses:$CPLUS_INCLUDE_PATH
#export CPLUS_INCLUDE_PATH=$HOME/local/include/ncursesw:$CPLUS_INCLUDE_PATH
#export C_INCLUDE_PATH=$HOME/local/include/ncursesw:$C_INCLUDE_PATH
#export C_INCLUDE_PATH=$HOME/local/include:$C_INCLUDE_PATH
#export C_INCLUDE_PATH=$HOME/local/include/ncurses:$C_INCLUDE_PATH
#export C_INCLUDE_PATH=$HOME/local/include/ncursesw:$C_INCLUDE_PATH

####################
### [ Set LIBRARY ] ###
####################
#export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH

###################
### [ Set Man ] ###
###################
export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH

#####################
### [ Set Pager ] ###
#####################
