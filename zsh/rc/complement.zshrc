# 補完候補を詰めて表示する
setopt list_packed

# 補完候補を矢印キーで選択する
zstyle ":completion:*:default" menu select true

# 補完候補に色をつける
zstyle ":completion:*:default" list-colors ""

# `=`の後でも補完を有効にする
setopt magic_equal_subst

### 補完侯補をメニューから選択する。
### select=2: 補完候補を一覧から選択する。補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2
### 補完候補に色を付ける。
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
### 補完候補がなければより曖昧に候補を探す。
### m:{a-z}={A-Z}: 小文字を大文字に変えたものでも補完する。
### r:|[._-]=*: 「.」「_」「-」の前にワイルドカード「*」があるものとして補完する。
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# カーソル位置で補完する
setopt complete_in_word

# 補完候補が複数あるときに自動的に一覧表示する
setopt auto_menu

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'

# preview directory's content with ls when completing cd
if [[ $(command -v exa) ]]; then
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
elif [ `uname` = "Linux" ]; then
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -1 --color=always $realpath'
else
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -1 $realpath'
fi

# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
