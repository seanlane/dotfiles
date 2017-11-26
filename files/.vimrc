" Source for much of this: https://github.com/jarolrod/vim-python-ide
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#rc()
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
"-------------------=== Code/Project navigation ===-------------
Plugin 'scrooloose/nerdtree'                " Project and file navigation'
Plugin 'vim-python/python-syntax'           " Python syntax highlighting

"-------------------=== Other ===-------------------------------
Plugin 'tpope/vim-surround'                 " Parentheses, brackets, quotes, XML tags, and more
Plugin 'flazz/vim-colorschemes'             " Colorschemes
Plugin 'vim-airline/vim-airline'            " Lean & mean status/tabline for vim
Plugin 'vim-airline/vim-airline-themes'     " Themes for airline

"-------------------=== Languages support ===-------------------
Plugin 'Valloric/YouCompleteMe'             " Autocomplete plugin

" Now we can turn our filetype functionality back on
call vundle#end()            " required
filetype plugin indent on
colorscheme gruvbox						" set vim colorscheme

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
set guifont=Hack\ for\ Powerline "make sure to escape the spaces in the name properly
set background=dark
syntax on

":autocmd FileType make set noexpandtab
"au BufNewFile,BufRead *.cu set ft=cpp


let g:python_highlight_all=1
let g:airline_theme='wombat'
let g:airline_powerline_fonts=1
"=====================================================
"" NERDTree settings
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeWinSize=40
autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments
nmap " :NERDTreeToggle<CR>
