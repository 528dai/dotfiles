scriptencoding utf-8

function! s:source(path) abort " {{{
  let s:rc_plugin_dir = g:rc_dir . '/plugins'
  execute 'source ' . s:rc_plugin_dir . '/' . a:path
endfunction " }}}

call s:source('fzf.vim')

if has('nvim') || has('python3')
  call s:source('deoplete.vim')
endif

call s:source('neosnippet.vim')

" ale  {{{
let g:ale_echo_msg_format = '[%linter%] %s'
nmap <silent> <LocalLeader>j <Plug>(ale_next_wrap)
nmap <silent> <LocalLeader>k <Plug>(ale_previous_wrap)
" }}}

" NERDTree {{{
"let NERDTreeShowHidden=1  " 隠しファイルの表示
let NERDTreeIgnore=['\.pyc$']
nnoremap <silent> <Leader>f :<C-u>NERDTreeToggle<CR>
" }}}

call s:source('airline.vim')

" vim-gitgutter {{{
let g:gitgutter_map_keys = 0
" }}}

call s:source('easymotion.vim')

" accelerated-jk {{{
nmap <silent>j <Plug>(accelerated_jk_gj)
nmap <silent>k <Plug>(accelerated_jk_gk)
" }}}

" jplus {{{
" J の挙動を jplus.vim で行う
nmap J <Plug>(jplus)
vmap J <Plug>(jplus)
" getchar() を使用して挿入文字を入力します
nmap <Leader>J <Plug>(jplus-getchar)
vmap <Leader>J <Plug>(jplus-getchar)
" }}}

" caw {{{
" 行の最初の文字の前にコメント文字をトグル
nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)
" }}}

" vimdoc-ja {{{
set helplang=ja,en
" }}}


" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
