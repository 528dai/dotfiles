#!/bin/bash

sudo locale-gen ja_JP.UTF-8

# zsh
if type zsh > /dev/null 2>&1; then
  ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
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

