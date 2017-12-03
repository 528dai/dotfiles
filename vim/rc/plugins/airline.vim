scriptencoding utf-8

" Mode shortening
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }

" Appearance
"let g:airline_powerline_fonts = 1
let g:airline_theme = 'hybrid'

" タブバーをかっこよく
let g:airline#extensions#tabline#enabled = 1

" 選択行列の表示をカスタム(デフォルトだと長くて横幅を圧迫するので最小限に)
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])

" Disable git hunks
" gitのHEADから変更した行の+-を非表示(vim-gitgutterの拡張)
let g:airline#extensions#hunks#enabled = 0

" Enable virtualenv name
"let g:airline#extensions#virtualenv#enabled = 1

" Enable ALE plugin
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = 'E:'
let g:airline#extensions#ale#warning_symbol = 'W:'


" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
