set nocompatible
set showmatch
set ignorecase
set mouse=v
set nohlsearch
set incsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set wildmode=longest, list
filetype plugin indent on
set mouse=a
set clipboard=unnamedplus
filetype plugin on
set cursorline
set ttyfast
set ruler
set encoding=utf-8
set relativenumber
set exrc
set guicursor=
set hidden
set noerrorbells
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set scrolloff=8
set noshowmode
set signcolumn=yes
set colorcolumn=80
set number
syntax on


set cmdheight=2

call plug#begin('~/.vim/plugged')
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-lua/plenary.nvim'
Plug 'alvan/vim-closetag'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
call plug#end()

colorscheme gruvbox
hi Normal guibg=none ctermbg=none

let NERDTreeQuitOnOpen=1
let mapleader=" "

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

