scriptencoding utf-8

nnoremap [Fzf] <Nop>
nmap m [Fzf]

let g:fzf_command_prefix = 'Fzf'
nnoremap <silent> <C-p> :FzfFiles<CR>
nnoremap <silent> [Fzf]f :FzfFiles<CR>
nnoremap <silent> <C-n> :FzfHistory<CR>
nnoremap <silent> [Fzf]h :FzfHistory<CR>
nnoremap <silent> [Fzf]b :FzfBuffers<CR>
nnoremap <silent> [Fzf]: :FzfCommands<CR>
nnoremap <silent> [Fzf]c :FzfHistory:<CR>


" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker

