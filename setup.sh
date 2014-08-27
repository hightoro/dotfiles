#!/bin/bash

# empty-directory
mkdir .emacs.d/buckup
mkdir .vim/buckup

# create symbolic-link in $HOME
ln -sfv ${PWD}/.gitignore ~/.gitignore
ln -sfv ${PWD}/.gitconfig ~/.gitconfig
ln -sfv ${PWD}/.tmux.conf ~/.tmux.conf
ln -sfv ${PWD}/.zshenv    ~/.zshenv
ln -sfv ${PWD}/.bashrc    ~/.bashrc
ln -sfv ${PWD}/.bash.d    ~/.bash.d
ln -sfv ${PWD}/.vimrc     ~/.vimrc
ln -sfv ${PWD}/.vim       ~/.vim
ln -sfv ${PWD}/.emacs.d   ~/.emacs.d
ln -sfv ${PWD}/.zsh.d     ~/.zsh.d
