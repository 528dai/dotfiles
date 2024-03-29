# Global alias
alias '..'='cd ..'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

alias -g G='| grep'
alias -g L='| less'
# alias -g C='| cat'  # fzf-tab と相性悪そう
alias -g B='| bat'

# ls / exa
if [[ $(command -v exa) ]]; then
  alias e='exa --icons'
  alias l=e
  alias ls=e
  alias ea='exa -a --icons'
  alias la=ea
  alias ee='exa -aal --icons'
  alias ll=ee
  alias et='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
  alias lt=et
  alias eta='exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
  alias lta=eta
else
  alias ls='ls -G'
  [ `uname` = "Linux" ] && alias ls='ls --color'
  alias lst='ls -ltr'
  alias l='ls -ltr'
  alias la='ls -la'
  alias ll='ls -l'
fi

# vim
#alias v='nvim'
alias v='vim'
alias vi='\vim'
#alias vim='nvim'
alias gv='mvim'
alias gvim='mvim'

alias mkdir="mkdir -p"
alias grep="grep --color=auto"
alias ssh="TERM=xterm-256color ssh"

alias cdd="cd ~/Desktop"
alias o="myopen"

# Git
alias gs="git status --short --branch"
alias gd="git diff"
alias gl="git log --pretty=format:\"%Cgreen%ad %Creset%s %Cred%d\" --date=short"
alias gll="git log --pretty=format:\"%Cblue%h %Cgreen%ad %Creset%s %Cred%d\" --stat"
alias gt="git for-each-ref --sort=-taggerdate --format='%(taggerdate:short)	%(tag)	%(taggername)	%(subject)' refs/tags"
alias ga="git add"
alias gc="git commit"
alias gps="git push"
alias gpl="git pull"
alias gf="git fetch --prune"
alias gco="git checkout"
alias gb="git branch"
alias gg="git grep -H --heading --break"
alias gmn="git merge --no-ff"

# alias -s
# 拡張子を見てうまくやってくれるやつ
alias -s py="python3"

# pyenv 入れてる時 brew doctor したら出る Warning を消す
# https://www.task-notes.com/entry/20141223/1419324649
# https://qiita.com/takc923/items/45386905f70fde9af0e7
alias brew="env PATH=${${PATH/~\/\.pyenv\/shims:/}/~\/\.cargo\/bin:/} brew"
