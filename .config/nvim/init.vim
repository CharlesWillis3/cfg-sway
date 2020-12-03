scriptencoding utf8

set number
set relativenumber
set wildmenu
set confirm
set nocompatible
set hidden
set encoding=utf-8
set softtabstop=2
set shiftwidth=2
set clipboard=unnamedplus
set t_Co=256

" ---- vim plug ----

call plug#begin('/home/cewillis3/.local/share/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/tagbar'
Plug 'vim-syntastic/syntastic'
Plug 'rust-lang/rust.vim'
"Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'enricobacis/vim-airline-clock'
Plug 'mhinz/vim-startify'
call plug#end()

syntax enable
filetype plugin indent on

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"let g:CtrlSpaceDefaultMappingKey = "<C-space> "

let g:deoplete#enable_at_startup = 1
let g:tablineclosebutton=1

nmap <F4> :TagbarToggle<CR>
