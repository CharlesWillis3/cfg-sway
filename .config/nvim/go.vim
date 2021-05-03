" =====================
"    Dev Mode Config
" =====================
scriptencoding utf8

source $HOME/.config/nvim/init.vim

set noshowmode
set hidden
set autowrite 
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes
set cmdheight=1

" ---- vim plug ----
call plug#begin('/home/cewillis3/.local/share/nvim/plugged/go')
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'morhetz/gruvbox'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'preservim/nerdcommenter'
Plug 'mcchrish/nnn.vim'
Plug 'joshdick/onedark.vim'
Plug 'preservim/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'enricobacis/vim-airline-clock'
Plug 'vim-airline/vim-airline-themes'
Plug 'machakann/vim-sandwich'
Plug 'psliwka/vim-smoothie'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'airblade/vim-gitgutter'
call plug#end()

source $HOME/.config/nvim/airline.vim

let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_CacheDirectory = '/home/cewillis3/.cache'
let g:AutoPairs = {'(':')', '[':']', '{':'}'}
let g:AutoPairsFlyMode = 0
let g:go_def_mapping_enabled = 0
let g:go_list_type = 'quickfix'
let g:go_fmt_command = 'goimports'
let g:go_highlight_types = 0
let g:go_highlight_fields = 1
let g:go_highlight_functions = 0
let g:go_highlight_function_calls = 0
let g:go_highlight_operators = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_doc_keywordprg_enabled = 0
let g:go_doc_keywordprg_enabled = 0

" vim-go
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>gb :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>gr <Plug>(go-run)
autocmd FileType go nmap <Leader>gt <Plug>(go-test)
autocmd FileType go nmap <Leader>gc <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>gi <Plug>(go-info)
autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
autocmd FileType go nmap gty :CocCommand go.tags.add yaml<cr>
autocmd FileType go nmap gtx :CocCommand go.tags.clear<cr>

nmap <silent><F4> :TagbarToggle<CR>

" quickfix
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <Leader>a :cclose<CR>

" coc mappings
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent><expr> <Tab>
  \ pumvisible() ? "\<C-n>" : "<Tab>"

inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> <Leader>[ <Plug>(coc-diagnostics-prev)
nmap <silent> <Leader>] <Plug>(coc-diagnostics-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gt <Plug>(coc-references)

nmap <Leader>rn <Plug>(coc-rename)
nmap <Leader>f  <Plug>(coc-format-selected)
nmap <Leader>a  <Plug>(coc-codeaction-selected)
nmap <Leader>ac <Plug>(coc-codeaction)
nmap <Leader>qf <Plug>(coc-fix-current)

nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> <Space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <Space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <Space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <Space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <Space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <Space>j  :<C-u>CocNext<CR>
nnoremap <silent> <Space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <Space>p  :<C-u>CocListResume<CR>

vmap <Leader>f <Plug>(coc-format-selected)
vmap <Leader>a <Plug>(coc-codeaction-selected)

autocmd CursorHold * silent call CocActionAsync('highlight')

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold   :call CocAction('fold', <f-args>)

augroup mygroup
  autocmd!
  autocmd FileType json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" source this config
nnoremap <Leader>sv :source $HOME/.config/nvim/go.vim<CR>
nnoremap <Leader>ev :edit $HOME/.config/nvim/go.vim<CR>

colorscheme gruvbox
