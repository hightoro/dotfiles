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

if [ -f ~/.bash.d/.bashrc ]; then
	source ~/.bash.d/.bashrc
fi

# end of file
