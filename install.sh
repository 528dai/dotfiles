#!/usr/bin/env zsh

sudo locale-gen ja_JP.UTF-8
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc
source ~/.zshrc
zplug install
zplug load --verbose

if type vim > /dev/null 2>&1; then
  ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
  ln -sf ~/dotfiles/vim ~/.vim
fi

if type tmux > /dev/null 2>&1; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
fi

# ln -sf ~/dotfiles/alacritty/alacritty.yml ~/.alacritty.yml

