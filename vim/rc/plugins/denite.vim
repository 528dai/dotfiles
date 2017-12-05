scriptencoding utf-8


if executable('rg')
  call denite#custom#var('file_rec', 'command',
  \ ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'default_opts',
  \ ['--vimgrep', '--no-heading'])
elseif executable('ag')
  call denite#custom#var('file_rec', 'command',
  \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
endif

call denite#custom#source('file_old', 'matchers', ['matcher_fuzzy', 'matcher_project_files'])
call denite#custom#source('tag', 'matchers', ['matcher_substring'])
call denite#custom#source('file_rec, grep', 'matchers', ['matcher_cpsm'])
call denite#custom#source('file_old', 'converters', ['converter_relative_word'])

call denite#custom#map('normal', "o",
      \ '<denite:do_action:default>')
call denite#custom#map('normal', "x",
      \ '<denite:do_action:split>')
call denite#custom#map('insert', "<C-x>",
      \ '<denite:do_action:split>')
call denite#custom#map('normal', "v",
      \ '<denite:do_action:vsplit>')
call denite#custom#map('insert', "<C-v>",
      \ '<denite:do_action:vsplit>')

call denite#custom#map('insert', '<C-r>',
      \ '<denite:toggle_matchers:matcher_substring>', 'noremap')
call denite#custom#map('insert', '<C-s>',
      \ '<denite:toggle_sorters:sorter_reverse>', 'noremap')
call denite#custom#map('insert', '<C-p>',
      \ '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-n>',
      \ '<denite:move_to_next_line>', 'noremap')

call denite#custom#map('normal', 'r',
      \ '<denite:do_action:quickfix>', 'noremap')
call denite#custom#map('insert',
      \ "jj", '<denite:enter_mode:normal>')


noremap [denite] <Nop>
map     m [denite]

" ファイル検索
nnoremap <silent>[denite]f :<C-u>Denite -highlight-mode-insert=Search file_rec<CR>
nnoremap <silent><C-p> :<C-u>Denite -highlight-mode-insert=Search file_rec<CR>
" バッファのパスを起点としたファイル検索
nnoremap <silent>[denite]<Space> :<C-u>DeniteBufferDir -split=vertical -highlight-mode-insert=Search file_rec directory_rec<CR>
" 最近使用したファイル
nnoremap <silent>[denite]m :<C-u>Denite -highlight-mode-insert=Search file_mru<CR>
nnoremap <silent><C-n> :<C-u>Denite -highlight-mode-insert=Search file_mru<CR>
" バッファ一覧
nnoremap <silent>[denite]b :<C-u>Denite -highlight-mode-insert=Search -no-empty -auto-preview buffer<CR>
" １つ前のバッファを開く
"nnoremap <silent>[denite]u :<C-u>Denite -no-empty -immediately buffer<CR>
" プログラミングにおけるアウトラインの表示
nnoremap <silent>[denite]o :<C-u>Denite -split=vertical -mode=normal outline<CR>
" コマンド
nnoremap <silent>[denite]: :<C-u>Denite -highlight-mode-insert=Search command<CR>
nnoremap <silent>[denite]c :<C-u>Denite -highlight-mode-insert=Search command_history<CR>
" grep検索
nnoremap <silent>[denite]gr :<C-u>Denite -mode=normal grep<CR>

" 検索
nnoremap <silent> [denite]/ :<C-u>Denite -buffer-name=search -auto-highlight -highlight-mode-insert=Search line<CR>
" 前回の検索パターンを使用して再検索
nnoremap <silent> [denite]n :<C-u>Denite -buffer-name=search -resume -mode=normal -refresh -highlight-mode-insert=Search<CR>
" カーソル上の単語で検索
nnoremap <silent> * :<C-u>DeniteCursorWord -buffer-name=search -auto-highlight -mode=normal -highlight-mode-insert=Search line<CR>

" レジスタ
nnoremap <silent> ;
      \ :<C-u>Denite -buffer-name=register
      \ register neoyank<CR>
xnoremap <silent> ;
      \ :<C-u>Denite -default-action=replace -buffer-name=register
      \ register neoyank<CR>



" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
