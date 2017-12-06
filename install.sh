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

ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc

curl -fLo \
     ~/dotfiles/vim/plug/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pip3 install --user --upgrade neovim
ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
ln -sf ~/dotfiles/vim ~/.vim
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/vim/vimrc ~/.config/nvim/init.vim

nvim --headless +PlugUpgrade +PlugClean! +PlugUpdate +qall

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
