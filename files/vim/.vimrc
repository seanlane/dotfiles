" Source for much of this: https://github.com/jarolrod/vim-python-ide
set nocompatible
filetype plugin indent on
"colorscheme gruvbox						" set vim colorscheme

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

"let g:ycm_path_to_python_interpreter=/usr/bin/python
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
