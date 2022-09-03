# ヒストリを保存するファイル名
HISTFILE=$ZSHRC_ROOT/zsh_history

# メモリ上に保存するヒストリ数
HISTSIZE=10000

# ファイルに保存されるヒストリ数
SAVEHIST=10000

# 直前と同じコマンドをヒストリを保存しない
setopt hist_ignore_dups

# ヒストリで重複したコマンドは古い方を削除する
setopt hist_ignore_all_dups

# 同じディレクトリをcdのヒストリに保存しない
setopt pushd_ignore_dups

# ヒストリに実行日時と実行時間も記録する
setopt extended_history

# zshプロセス間でヒストリを共有する
setopt share_history

