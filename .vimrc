set encoding=utf-8
scriptencoding utf-8

" sane buffer handling
set hidden
set autowrite
set noswapfile

set autoread
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime

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

" file search
set path=**
nnoremap <leader><leader> :find 
nnoremap <leader>b :buffer 
nnoremap <leader>f :grep 

" windows
nnoremap <leader>w :close<CR>
nnoremap <leader>/ :vsplit<CR><C-w>l
nnoremap <leader>- :split<CR><C-w>j
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
nnoremap <M-,> <C-w><
nnoremap <M--> <C-w>-
nnoremap <M-=> <C-w>+
nnoremap <M-.> <C-w>>

" move around lines in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" quickfix & location list
nnoremap <leader>cn :cnext<CR>zzzv
nnoremap <leader>cp :cprev<CR>zzzv
nnoremap <leader>cc :cwindow<CR>
