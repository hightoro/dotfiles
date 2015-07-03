#!/bin/bash

## empty-directory
mkdir ${PWD}/.emacs.d/backup
mkdir ${PWD}/.vim/backup

## create symbolic-link in $HOME
ln -sfv  ${PWD}/.conkyrc   ~/.conkyrc
ln -sfv  ${PWD}/.gitignore ~/.gitignore
ln -sfv  ${PWD}/.gitconfig ~/.gitconfig
ln -sfv  ${PWD}/.tmux.conf ~/.tmux.conf
#ln -sfv  ${PWD}/.emacs     ~/.emacs
ln -snfv ${PWD}/.emacs.d   ~/.emacs.d
ln -sfv  ${PWD}/.zshenv    ~/.zshenv
#ln -snfv ${PWD}/.zsh.d     ~/.zsh.d
#ln -sfv  ${PWD}/.bashrc    ~/.bashrc
#ln -snfv ${PWD}/.bash.d    ~/.bash.d
ln -sfv  ${PWD}/.vimrc     ~/.vimrc
ln -snfv ${PWD}/.vim       ~/.vim

## git submodule
git submodule init
git submodule update

## other setting

