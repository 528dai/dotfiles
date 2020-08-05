#!/bin/bash

if [ "$(uname)" == 'Darwin' ]; then
  os='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  os='Linux'
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
  os='Cygwin'
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

set -eo pipefail

ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc
# zlug install

ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
ln -sf ~/dotfiles/vim ~/.vim

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

# ln -sf ~/dotfiles/alacritty/alacritty.yml ~/.alacritty.yml

# ln -sf ~/dotfiles/gdb/gdb-dashboard/.gdbinit ~/.gdbinit
