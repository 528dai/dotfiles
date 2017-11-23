" Disable default mappings
let g:EasyMotion_do_mapping = 0 

let g:EasyMotion_keys = ';HKLYUIONM,WERTXCVBASDGJF'"

"let g:EasyMotion_use_smartsign_us = 1 " US layout
" or
let g:EasyMotion_use_smartsign_jp = 1 " JP layout

" Use upper case
let g:EasyMotion_use_upper = 1

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1


"" Mapping {{{
map f <Plug>(easymotion-bd-fl)
map  F <Plug>(easymotion-Fl)

nmap s <Plug>(easymotion-overwin-f2)
vmap s <Plug>(easymotion-bd-f2)
omap z <Plug>(easymotion-s2)

map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>l <Plug>(easymotion-lineforward)

" Search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" }}}

