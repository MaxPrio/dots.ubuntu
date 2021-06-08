#!/bin/bash

sudo apt install -y --no-install-recomends vim-gtk xkb-switch 
if [[ ! -d ~/.vim ]]
    then
        # install vimplug and plugins
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        # install plugins
        vim -es -u ~/.vimrc -i NONE -c "PlugInstall" -c "qa"
    fi



