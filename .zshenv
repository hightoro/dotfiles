########
## [ echo ] ##
########
if [[ $ZDOTDIR != $HOME/.zsh.d ]]; then

    if [[ -o login ]] ; then
        echo "login shell"
    else
        echo "_no_ login shell"
    fi
    #echo "read ~/.zshenv"

    # soruce
    export ZDOTDIR=$HOME/.zsh.d
    #source ${ZDOTDIR}/.zshenv

    autoload -Uz is-at-least
    if is-at-least 5.0.5; then
        echo ""
        #source $ZDOTDIR/.zshenv
    elif is-at-least 5.0.2; then
        echo ""
        ##  auto load $ZDOTDIR/.zshenv
    else
        source $ZDOTDIR/.zshenv
    fi

fi

