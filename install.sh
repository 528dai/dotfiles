#!/bin/bash

set -eu

ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc
# zlug install

ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
ln -sf ~/dotfiles/vim ~/.vim

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

# ln -sf ~/dotfiles/alacritty/alacritty.yml ~/.alacritty.yml

