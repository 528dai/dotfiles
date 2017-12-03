scriptencoding utf-8

if !exists('g:syntax_on')
  syntax enable
endif

"" Visibility {{{
set listchars=tab:▸\ ,
set list
set showbreak=\

" hl trailing spaces instead of trail:c
function! s:hl_trailing_spaces()
  " Test   
  highlight! link TrailingSpaces Error
  syntax match TrailingSpaces containedin=ALL /\s\+$/
endfunction
autocmd MyAutoCmd BufWinEnter,ColorScheme * call s:hl_trailing_spaces()
" }}}

"" Completion {{{
set completeopt&
set completeopt+=preview
" set completeopt+=longest
set completeopt+=menuone
" set completeopt+=noinsert
set completeopt+=noselect

set previewheight=5
set splitbelow " sohw preview window at bottom

set infercase "Ignore case on insert completion
set showfulltag "Show rich info for ins-completion

set wildmenu " Command line autocompletion
set wildmode=longest,full
" }}}

"" Conceal {{{
set conceallevel=2
set concealcursor=iv
" }}}

"" Encoding {{{
set encoding=utf-8 "Sets the character encoding used inside Vim
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932,euc-jp "A list of character encodings
set fileformats=unix,dos,mac "This gives the end-of-line (<EOL>) formats
" }}}

"" Fold {{{
set foldenable "Enable fold
set foldlevel=100 "Folds with a higher level will be closed
"}}}

"" Indent {{{
set autoindent "Copy indent from current line when starting a new line
set expandtab "Use the appropriate number of spaces to insert a <Tab>
set shiftround "Round indent to multiple of 'shiftwidth'
set shiftwidth=2 "Number of spaces to use for each step of (auto)indent
set softtabstop=2 "Number of spaces that a <Tab> counts for while editing operations
set tabstop=2 "Number of spaces that a <Tab> in the file counts for
let g:vim_indent_cont = 0
" }}}

"" Lang: {{{
"language C "Set locale
set spelllang=en,cjk "Spell checking language
" }}}

"" Search: {{{
set incsearch " Incremental searching
set ignorecase " Ignore case in search patterns
set smartcase " Override the ignorecase option if the pattern contains upper case
set hlsearch | nohlsearch " Highlight search patterns, support reloading
set wrapscan " Searches wrap around the end of the file.
"}}}

"" Undo {{{
if has('persistent_undo')
  let &undodir = g:vim_root . '/undo'
  set undofile "Automatically saves undo history
  set undoreload=1000 "Save the whole buffer for undo when reloading it
endif
"}}}

"" Viminfo {{{
if has('nvim')
  set shada=!,'300,<50,s10,h
  let &shada .= ',n' .  g:vim_root . '/info/main.shada'
else
  set viminfo=!,'300,<50,s10,h
  let &viminfo .= ',n' .  g:vim_root . '/info/viminfo.txt'
endif"
" }}}

"" Swap {{{
set noswapfile
"}}}

"" Misc {{{
set autoread "Automatically read file again which has been changed outside of Vim
set backspace=indent,eol,start "Working of <BS>,<Del>,CTRL-W,CTRL-U
set colorcolumn=80
set diffopt+=iwhite,vertical "Ignore changes in amount of white space
set display=lastline "Display as much as possible of the last line
set grepprg=internal "Program to use for the :grep command
set helplang& helplang=en,ja " If true Vim master, use English help file
set hidden "Display another buffer when current buffer isn't saved.
set history=1024 "Amount of Command history
set keywordprg=:help "Open Vim internal help by K command
set laststatus=2 "Always display statusline
set lazyredraw "Do not redraw while executing macros
set matchpairs+=<:> "Characters that form pairs
set matchtime=1 "Tenths of a second to show the matching paren
set modeline "Set Vim local buffer option to specific file
set noerrorbells "Don't ring the bell for error messages
set novisualbell "Don't use visual bell instead of beeping
set number " Show line number.
set nrformats-=octal "Bases Vim will consider for numbers(Ctrl-a,Ctrl-x)
set ruler "Show the line and column number of the cursor position
set showmatch " Highlight parenthesis.
set shortmess+=I "Don't give the message when starting Vim :intro
set virtualedit=block "Cursor can be positioned virtually when Visual-block mode
set whichwrap=b,s,h,l,[,],<,> "Allow specified keys to move to the previous/next line
set wrap "Lines longer than the width of the window will wrap
set wrapscan "Searches wrap around the end of the file
" }}}

"" Misc-conditional {{{
if has('ambiwidth')
  " ref: https://gist.github.com/sgk/5991138
  set ambiwidth=double "Use twice the width of ASCII characters for Multibyte
endif

" Use clipboard register.
if (!has('nvim') || $DISPLAY != '') && has('clipboard')
  if has('unnamedplus')
     set clipboard& clipboard+=unnamedplus
  else
     set clipboard& clipboard+=unnamed
  endif
endif

" 開いているファイルのディレクトリに自動的に移動する
if has('autochdir')
  set autochdir
endif

" If we have Vim 7.4, add j to the format options to get rid of comment
" leaders when joining lines
if v:version >= 704
  set formatoptions+=j
endif

if has('termguicolors')
  set termguicolors
endif
" }}}


" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
