#!/bin/bash

set -eo pipefail

brew install zsh
ln -sf ~/dotfiles//zsh/zshrc ~/.zshrc

curl -fLo \
     ~/dotfiles/vim/plug/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pip3 install --user --upgrade neovim
brew install neovim
ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
ln -sf ~/dotfiles/vim ~/.vim
ln -sf ~/dotfiles/vim/vimrc ~/.config/nvim/init.vim

nvim --headless +PlugUpgrade +PlugClean! +PlugUpdate +qall
