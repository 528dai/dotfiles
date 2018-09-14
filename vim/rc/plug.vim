scriptencoding utf-8

let s:plug_dir = g:vim_root . '/plug'

if has('vim_starting')
  execute 'set runtimepath^=' . fnameescape(s:plug_dir)
endif

call plug#begin(g:vim_root . '/plugged')

if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'critiqjo/lldb.nvim', { 'do': ':UpdateRemotePlugins' }
elseif has('python3')
  Plug 'Shougo/denite.nvim'
endif

if has('nvim') || has('python3')
  Plug 'Shougo/neoyank.vim'
  Plug 'Shougo/neomru.vim'
  Plug 'Shougo/unite-outline'
  Plug 'pocari/vim-denite-command-history'
  Plug 'nixprime/cpsm',  { 'do': 'env PY3=ON ./install.sh'}
endif

Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

Plug 'w0rp/ale'

Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin' 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'Yggdroot/indentLine'
Plug 'cohama/lexima.vim'

Plug 'easymotion/vim-easymotion'
Plug 'rhysd/accelerated-jk'
Plug 'osyo-manga/vim-jplus'
Plug 'tyru/caw.vim'
Plug 'tpope/vim-surround'

Plug 'tyru/open-browser.vim'

" Colorscheme
Plug 'w0ng/vim-hybrid'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'tomasr/molokai'
Plug 'jdkanani/vim-material-theme'
Plug 'jacoborus/tender.vim'
Plug 'KeitaNakamura/railscasts.vim'
Plug 'KeitaNakamura/neodark.vim'

Plug 'vim-jp/vimdoc-ja'

call plug#end()


" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
