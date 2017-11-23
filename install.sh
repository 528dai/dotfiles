#!/bin/bash

if [ "$(uname)" == 'Darwin' ]; then
  OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='Linux'
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then                                                                                           
  OS='Cygwin'
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

set -eo pipefail

case "$OS" in
  'Mac') brew install zsh;;
  'Linux') sudo apt-get install zsh;; 
  *) echo "$OS Didn't match anything"
esac

ln -sf ~/dotfiles//zsh/zshrc ~/.zshrc

curl -fLo \
     ~/dotfiles/vim/plug/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

case "$OS" in
  'Mac') brew install neovim;;
  'Linux') sudo apt-get install neovim;; 
  *) echo "$OS Didn't match anything"
esac
pip3 install --user --upgrade neovim
ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
ln -sf ~/dotfiles/vim ~/.vim
ln -sf ~/dotfiles/vim/vimrc ~/.config/nvim/init.vim

nvim --headless +PlugUpgrade +PlugClean! +PlugUpdate +qall
