"-----------------------
"      Init Config
"-----------------------
set encoding=utf-8
set clipboard=unnamedplus
set mouse=a
set expandtab shiftwidth=2 tabstop=2 softtabstop=2
set termguicolors
set number
set relativenumber
set hidden

let mapleader="\\"
let g:nnn#set_default_mappings = 0
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
let g:nnn#command = 'nnn -d'
let g:nnn#replace_netrw = 1

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
nnoremap <Leader><Leader>l :ls<CR>
nnoremap <Leader><Leader>b :bp<CR>
nnoremap <Leader><Leader>f :bn<CR>
nnoremap <Leader><Leader>g :e#<CR>
nnoremap <Leader><Leader>bg :buffers<CR>:buffer<Space>

" move current line up/down
nnoremap <M-Up> ddkP
nnoremap <M-Down> ddjP

call plug#begin('/home/cewillis3/.local/share/nvim/plugged/init')
Plug 'joshdick/onedark.vim'
Plug 'psliwka/vim-smoothie'
Plug 'mcchrish/nnn.vim'
Plug 'ryanoasis/vim-devicons'
call plug#end()

nnoremap <silent><leader>n :NnnPicker %:p:h<CR>

colorscheme onedark
"colorscheme desert
"colorscheme evening
"colorscheme slate
"colorscheme torte

" force redraw when vim had loaded for terminal in window manager compat
autocmd vimenter * :silent exec "!kill -s SIGWINCH $PPID"
" transparent bg
autocmd vimenter * hi! Normal ctermbg=NONE guibg=NONE
autocmd vimenter * hi! NonText ctermbg=NONE guibg=NONE
