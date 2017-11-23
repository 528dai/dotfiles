scriptencoding utf-8

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#expand_word_boundary = 1
let g:neosnippet#snippets_directory = g:vim_root . '/snippets'

imap <C-l> <Plug>(neosnippet_expand_or_jump)
smap <C-l> <Plug>(neosnippet_expand_or_jump)
xmap <C-l> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
