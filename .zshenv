##############
## [ echo ] ##
##############
if [[ $ZDOTDIR != $HOME/.zsh.d ]]; then

    # echo
    if [[ -o login ]] ; then
        echo "![ login shell ]!"
    else
        echo "![ _no_ login shell ]!"
    fi
    echo "read ~/.zshenv"

    # export
    export ZDOTDIR=$HOME/.zsh.d

    # source
    autoload -Uz is-at-least
    if is-at-least 5.0.2; then
        ;
	    #echo ""
        ##  auto load $ZDOTDIR/.zshenv
    else
        source $ZDOTDIR/.zshenv
    fi

fi
