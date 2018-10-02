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

ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
ln -sf ~/dotfiles/vim ~/.vim

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
