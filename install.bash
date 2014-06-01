#!/usr/bin/env bash

if [ -d $HOME/.dotfiles ]; then
    cd $HOME/.dotfiles
    git pull origin master
else
    git clone https://github.com/eprev/dotfiles.git $HOME/.dotfiles
    if [ -f $HOME/.bash_profile ] || [ -h $HOME/.bash_profile ]; then
        mv $HOME/.bash_profile $HOME/.bash_profile.before-dotfiles;
    fi
    if [ -f $HOME/.bashrc ] || [ -h $HOME/.bashrc ]; then
        mv $HOME/.bashrc $HOME/.bashrc.before-dotfiles;
    fi
    cp $HOME/.dotfiles/bash_profile $HOME/.bash_profile
    cp $HOME/.dotfiles/bashrc $HOME/.bashrc
    ln -s .dotfiles/gitconfig .gitconfig
    ln -s .dotfiles/gitignore .gitignore
    ln -s .dotfiles/inputrc .inputrc
    ln -s .dotfiles/tmux.conf .tmux.conf
    ln -s .dotfiles/vim .vim
    ln -s .dotfiles/vimrc .vimrc
fi

source $HOME/.bash_profile