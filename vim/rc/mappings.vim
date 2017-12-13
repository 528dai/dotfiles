scriptencoding utf-8

" Easy escape."{{{
inoremap jj <ESC>
cnoremap <expr> j
      \ getcmdline()[getcmdpos()-2] ==# 'j' ? "\<BS>\<C-c>" : 'j'
onoremap jj <ESC>

inoremap j<Space>     j
"}}}

" Release keymappings
nnoremap ;  <Nop>
nnoremap ,  <Nop>
nnoremap m  <Nop>
nnoremap M m

" Use '\<Space>' instead of '\'.
" Use <Leader>
let g:mapleader = "\<Space>"
" Use <LocalLeader>
let g:maplocalleader = ','

" Disable Ex-mode.
nnoremap Q q

" Disable ZZ.
nnoremap ZZ <Nop>

" Don't use register by x
nnoremap x "_x

" register
nmap <silent>; "

" Useful save mappings. 
nnoremap <silent> <Leader><Leader> :<C-u>update<CR>

nnoremap H 0
nnoremap L $

" windows and buffers "{{{
" The prefix key.
nnoremap [window] <C-w>
nmap t [window]
nnoremap <silent> [window]x :<C-u>split<CR>:wincmd w<CR>
nnoremap <silent> [window]v :<C-u>vsplit<CR>:wincmd w<CR>
nnoremap <silent> [window]o :<C-u>only<CR>
" nnoremap <silent> <Tab> :wincmd w<CR>
" nnoremap <silent> L :wincmd w<CR>
" nnoremap <silent> H :wincmd W<CR>
nnoremap <silent><expr> q winnr('$') != 1 ? ':<C-u>close<CR>' : ""
nnoremap <silent> [window]q :<C-u>q<CR>
"}}}


nmap <C-u> <C-^> 


" Emacs-like cursor move in insert/command-line mode "{{{
" :h mapmode-ic
noremap! <C-b> <Left>
noremap! <C-f> <Right>
noremap! <C-a> <Home>
noremap! <C-e> <End>
" }}}


" Yank from cursor position to end of line
nnoremap Y y$

" Yank with keeping cursor position in visual mode {{{
function! s:keepcursor_visual_wrapper(command)
  execute 'normal! gv' . a:command
  execute "normal! gv\<ESC>"
endfunction
xnoremap <silent> y :<C-u>call <SID>keepcursor_visual_wrapper('y')<CR>
xnoremap <silent> Y :<C-u>call <SID>keepcursor_visual_wrapper('Y')<CR>
"}}}


" Indent
nnoremap > >>
nnoremap < <<
nnoremap == gg=G
xnoremap > >gv
xnoremap < <gv


" Change basic commands "{{{
" The prefix key.
nnoremap [Alt]   <Nop>
nmap    S  [Alt]
" Indent paste.
nnoremap <silent> [Alt]p o<Esc>pm``[=`]``^
xnoremap <silent> [Alt]p o<Esc>pm``[=`]``^
nnoremap <silent> [Alt]P O<Esc>Pm``[=`]``^
xnoremap <silent> [Alt]P O<Esc>Pm``[=`]``^
" Insert blank line.
nnoremap <silent> [Alt]o o<Space><BS><ESC>
nnoremap <silent> [Alt]O O<Space><BS><ESC>
" Insert space.
nnoremap <silent> [Alt]<Space> i<Space><ESC>
"}}}


" Smart <C-f>, <C-b>.
noremap <expr> <C-f> max([winheight(0) - 2, 1])
      \ . "\<C-d>" . (line('w$') >= line('$') ? "L" : "H")
noremap <expr> <C-b> max([winheight(0) - 2, 1])
      \ . "\<C-u>" . (line('w0') <= 1 ? "H" : "L")

" Redraw.
nnoremap <silent> <C-l>    :<C-u>redraw!<CR>

" If press l on fold, fold open.
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zo0' : 'l'
" If press l on fold, range fold open.
xnoremap <expr> l foldclosed(line('.')) != -1 ? 'zogv0' : 'l'

" Clear highlight.
nnoremap <silent><ESC><ESC> :nohlsearch<CR>:match<CR>

" Improved increment. {{{
nmap <C-a> <SID>(increment)
nmap <C-x> <SID>(decrement)
nnoremap <silent> <SID>(increment)    :AddNumbers 1<CR>
nnoremap <silent> <SID>(decrement)   :AddNumbers -1<CR>
command! -range -nargs=1 AddNumbers
      \ call s:add_numbers((<line2>-<line1>+1) * eval(<args>))
function! s:add_numbers(num) abort
  let prev_line = getline('.')[: col('.')-1]
  let next_line = getline('.')[col('.') :]
  let prev_num = matchstr(prev_line, '\d\+$')
  if prev_num != ''
    let next_num = matchstr(next_line, '^\d\+')
    let new_line = prev_line[: -len(prev_num)-1] .
          \ printf('%0'.len(prev_num . next_num).'d',
          \    max([0, prev_num . next_num + a:num])) . next_line[len(next_num):]
  else
    let new_line = prev_line . substitute(next_line, '\d\+',
          \ "\\=printf('%0'.len(submatch(0)).'d',
          \         max([0, submatch(0) + a:num]))", '')
  endif

  if getline('.') !=# new_line
    call setline('.', new_line)
  endif
endfunction " }}}


" For Undo Revision, Break Undo Sequence "{{{
inoremap <CR> <C-g>u<CR>
inoremap <C-h> <C-g>u<C-h>
inoremap <BS> <C-g>u<BS>
inoremap <Del> <C-g>u<Del>
inoremap <C-d> <C-g>u<Del>
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>
"}}}


" Visual mode keymappings: "{{{
" <TAB>: indent.
xnoremap <TAB>  >
" <S-TAB>: unindent.
xnoremap <S-TAB>  <

" Select rectangle.
xnoremap r <C-v>

" Substitute.
xnoremap s :s//g<Left><Left>

if (!has('nvim') || $DISPLAY != '') && has('clipboard')
  xnoremap <silent> y "*y:let [@+,@"]=[@*,@*]<CR>
endif
"}}}


" Insert mode keymappings: "{{{
" <C-t>: insert tab.
inoremap <C-t>  <C-v><TAB>
" Enable undo <C-w> and <C-u>.
inoremap <C-w>  <C-g>u<C-w>
inoremap <C-u>  <C-g>u<C-u>

" コンマ後には空白を入れる
inoremap , ,<Space>

if has('gui_running')
  inoremap <ESC> <ESC>
endif
"}}}


" Command-line mode keymappings:"{{{
cnoremap <C-a>          <Home>
cnoremap <C-b>          <Left>
cnoremap <C-d>          <Del>
cnoremap <C-e>          <End>
cnoremap <C-f>          <Right>
cnoremap <C-n>          <Down>
cnoremap <C-p>          <Up>
" <C-k>, K: delete to end.
cnoremap <C-k> <C-\>e getcmdpos() == 1 ?
      \ '' : getcmdline()[:getcmdpos()-2]<CR>
" <C-y>: paste.
cnoremap <C-y>          <C-r>*
" <C-g>: Exit.
cnoremap <C-g>          <C-c>
"}}}


" Terminal  {{{
if has('nvim')
  " nnoremap <Leader>t :vsplit<CR>:terminal<CR>
  tnoremap <ESC>     <C-\><C-n>
  tnoremap jj        <C-\><C-n>
  tnoremap j<Space>  j
endif
"  }}}


" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
