" Configs
set autoindent
set backspace=2
set cmdheight=3
set colorcolumn=80
set cursorcolumn
set cursorline
set expandtab
set exrc
set number
set relativenumber
set numberwidth=2
set sw=4
set sc
set showmatch
set sft
set smartindent
set smarttab
set ts=4
set syntax=ON
set nowrap
set encoding=utf-8
set nocompatible
set ttyfast
set scrolloff=10
set noshowmode

" Pluggins

call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'vifm/vifm.vim'
Plug 'rstacruz/sparkup'
Plug 'jiangmiao/auto-pairs'

call plug#end()

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Colors

let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

colorscheme gruvbox

hi Normal guibg=none ctermbg=none


" Mappings

let mapleader=" "

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>c :bd<CR>
nnoremap <Leader>o :EditVifm<CR>
nnoremap <Leader>s :VsplitVifm<CR>
nnoremap <Leader>. <c-w>l:set scrolloff=10<CR>
nnoremap <Leader>, <c-w>h:set scrolloff=10<CR>

" Functions

" Credit to THE_PRIMEAGEN
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup NOBORITA
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" see :h syntastic-loclist-callback
function! SyntasticCheckHook(errors)
    if !empty(a:errors)
        let g:syntastic_loc_list_height = min([len(a:errors), 10])
    endif
endfunction
