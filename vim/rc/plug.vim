scriptencoding utf-8

let s:plug_dir = g:vim_root . '/plug'

if has('vim_starting')
  execute 'set runtimepath^=' . fnameescape(s:plug_dir)
endif

call plug#begin(g:vim_root . '/plugged')

Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'critiqjo/lldb.nvim', { 'do': ':UpdateRemotePlugins' }
elseif has('python3')
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

if has('nvim') || has('python3')
  Plug 'zchee/deoplete-clang', { 'for': ['c', 'cpp'] }
  Plug 'zchee/deoplete-jedi', { 'for': 'python' }
endif

Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

Plug 'w0rp/ale'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } | Plug 'Xuyuanp/nerdtree-git-plugin' 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

Plug 'Yggdroot/indentLine'

Plug 'easymotion/vim-easymotion'
Plug 'rhysd/accelerated-jk'
Plug 'osyo-manga/vim-jplus'
Plug 'tyru/caw.vim'

Plug 'w0ng/vim-hybrid'
Plug 'kristijanhusak/vim-hybrid-material'

Plug 'vim-jp/vimdoc-ja'

call plug#end()


" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
