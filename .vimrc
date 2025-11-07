set encoding=utf-8
scriptencoding utf-8

" sane buffer handling
set hidden
set autowrite
set noswapfile

" tabs
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" search
set ignorecase smartcase
set scrolloff=3

" visuals
set number
syntax on

" keybindings
let mapleader = ' '
nnoremap <leader>w :close<CR>
nnoremap <leader>/ :vsplit<CR><C-w>l
nnoremap <leader>- :split<CR><C-w>j
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <A-,> <C-w><
nnoremap <A--> <C-w>-
nnoremap <A-=> <C-w>+
nnoremap <A-.> <C-w>>
" move around lines in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" quickfix & location list
nnoremap <leader>cn :cnext<CR>zzzv
nnoremap <leader>cp :cprev<CR>zzzv
nnoremap <leader>cc :cwindow<CR>
