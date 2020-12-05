" =====================
"    Dev Mode Config
" =====================
scriptencoding utf8

source $HOME/.config/nvim/init.vim

set noshowmode

" ---- vim plug ----

call plug#begin('/home/cewillis3/.local/share/nvim/dev/plugged')
Plug 'morhetz/gruvbox'
Plug 'machakann/vim-sandwich'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/tagbar'
Plug 'vim-syntastic/syntastic'
Plug 'rust-lang/rust.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'enricobacis/vim-airline-clock'
Plug 'mhinz/vim-startify'
Plug 'psliwka/vim-smoothie'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'mcchrish/nnn.vim'
call plug#end()

syntax enable
filetype plugin indent on

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:deoplete#enable_at_startup = 1
let g:tablineclosebutton= 1
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_CacheDirectory = '/home/cewillis3/.cache'

function! WindowNumber(...)
    let builder = a:1
    let context = a:2
    call builder.add_section('airline_b', '%{tabpagewinnr(tabpagenr())}')
    return 0
endfunction

call airline#add_statusline_func('WindowNumber')
call airline#add_inactive_statusline_func('WindowNumber')

nmap <silent><F4> :TagbarToggle<CR>

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

colorscheme gruvbox
" transparent bg
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
" force redraw when vim had loaded for terminal in window manager compat
autocmd vimenter * :silent exec "!kill -s SIGWINCH $PPID"
