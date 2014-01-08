" Choose no compatibility with legacy vi
set nocompatible

" General
set encoding=utf-8
syntax enable
set title
set number
set ruler
set cursorline
set cuc
set laststatus=2
set statusline=%F%m%r%h%w[%L]%y[%p%%][%04v]
"              | | | | |  |   |      |  |
"              | | | | |  |   |      |  |
"              | | | | |  |   |      |  |
"              | | | | |  |   |      |  |
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in
"              | | | | |  |   |          square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the rbuffer
filetype plugin indent on
set noswapfile

" GUI
set t_Co=256
set guifont=Consolas:h13
colorscheme solarized
set background=dark

" use comma as <Leader> key instead of backslash
let mapleader=","

" Whitespace
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set gdefault
set showmatch
nnoremap <leader><space> :noh<cr>
nmap <Space> /

" Disable arrows
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Splits
" v to open a new vertical split and switch to it
nnoremap <leader>v <C-w>v<C-w>l
" Move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-c> <C-w>c
nnoremap <C-o> <C-w>o

" Switch between buffers
noremap <tab> :bn<cr>
noremap <S-tab> :bp<cr>


" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" PLUGINS
" Load all bundles in .vim/bundles
call pathogen#infect()

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" ACK
set grepprg=ack
nnoremap <leader>a :Ack
map <C-n> :cn<cr>
map <C-p> :cp<cr>

" TComment
map <leader>co :TComment<cr>

" VIM-I18N
map <Leader>z :call I18nTranslateString()<CR>

" TABULAR
map <Leader>a= :Tabularize /=<CR>
map <Leader>a: :Tabularize /:\zs<CR>

"" --------------------- LaTeX configuration
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'

" problems with e-acute character
imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine
