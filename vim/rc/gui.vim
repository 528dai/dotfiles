""" GUI:

"" Fonts: "{{{
set ambiwidth=double

set guifont=HackGen\ Console\ NF:h18

set background=dark
"colorscheme hybrid_material

"" Mouse:"{{{
set mouse=
set mousemodel=

" Don't focus the window when the mouse pointer is moved.
set nomousefocus
" Hide mouse pointer on insert mode.
set mousehide
"}}}

"" Menu:"{{{
" Hide toolbar and menus.
set guioptions-=Tt
set guioptions-=m
" Scrollbar is always off.
set guioptions-=rL
" Not guitablabel.
set guioptions-=e

" Confirm without window.
set guioptions+=c
"}}}

"" Views:"{{{
" Don't highlight search result.
set nohlsearch

" Don't flick cursor.
set guicursor&
set guicursor+=a:blinkon0
"}}}


" vim: foldmethod=marker
