"--------------------
"   Airline Config
"--------------------

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#cursormode#enabled = 1
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#formatter = 'short_path'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#buffer_idx_format = {
  \ '1': '➊ ',
  \ '2': '➋ ',
  \ '3': '➌ ',
  \ '4': '➍ ',
  \ '5': '➎ ',
  \ '6': '➏ ',
  \ '7': '➐ ',
  \ '8': '➑ ',
  \ '9': '➒ '
  \}

function! WindowNumber(...)
  let builder = a:1
  let context = a:2
  call builder.add_section('airline_b', '%{tabpagewinnr(tabpagenr())}')
  return 0
endfunction

call airline#add_statusline_func('WindowNumber')
call airline#add_inactive_statusline_func('WindowNumber')

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \1 \2 \3 : go to buffer 1/2/3 etc
nmap <Leader>1 <Plug>AirlineSelectTab1
nmap <Leader>2 <Plug>AirlineSelectTab2
nmap <Leader>3 <Plug>AirlineSelectTab3
nmap <Leader>4 <Plug>AirlineSelectTab4
nmap <Leader>5 <Plug>AirlineSelectTab5
nmap <Leader>6 <Plug>AirlineSelectTab6
nmap <Leader>7 <Plug>AirlineSelectTab7
nmap <Leader>8 <Plug>AirlineSelectTab8
nmap <Leader>9 <Plug>AirlineSelectTab9
nmap <Leader>- <Plug>AirlineSelectPrevTab
nmap <Leader>+ <Plug>AirlineSelectNextTab
