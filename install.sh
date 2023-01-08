#!/bin/bash

sudo locale-gen ja_JP.UTF-8

# zsh
if type zsh > /dev/null 2>&1; then
  mkdir -p ~/.zinit
  git clone https://github.com/zdharma-continuum/zinit.git ~/.zinit/bin
  ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc
fi

# vim
if type vim > /dev/null 2>&1; then
  ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
  ln -sf ~/dotfiles/vim ~/.vim
fi

# tmux
if type tmux > /dev/null 2>&1; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
fi

# alacritty
# ln -sf ~/dotfiles/alacritty/alacritty.yml ~/.alacritty.yml

