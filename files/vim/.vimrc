" Manage plugins using Vim native plugin manager: 
" https://gist.github.com/manasthakur/d4dc9a610884c60d944a4dd97f0b3560
set nocompatible
filetype plugin indent on

"=====================================================
"" General settings
"=====================================================
set shell=/bin/bash
set number
set tabstop=4
set softtabstop=4
set expandtab
set showmatch
set autoindent
set t_Co=256
set encoding=utf-8
"set guifont=Hack\ for\ Powerline "make sure to escape the spaces in the name properly
set background=dark
set backspace=2 " make backspace work like most other programs
syntax on

":autocmd FileType make set noexpandtab
"au BufNewFile,BufRead *.cu set ft=cpp

let base16colorspace=256  " Access colors present in 256 colorspace
let g:python_highlight_all=1
"let g:airline_theme='wombat'
"let g:airline_powerline_fonts=1

"=====================================================
"" NERDTree settings
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeWinSize=40
autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments
nmap " :NERDTreeToggle<CR>
