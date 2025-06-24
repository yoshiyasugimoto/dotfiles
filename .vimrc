" Basic Settings
set nocompatible
syntax enable

" Japanese Language Support
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,sjis
set iminsert=0
set imsearch=0
set number
set norelativenumber
set ruler
set showcmd
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
set wildmenu
set wildmode=list:longest,full
set backspace=indent,eol,start

" Indentation and Tabs
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" File and Buffer Management
set hidden
set autoread
set noswapfile
set nobackup
set undofile
set undodir=~/.vim/undodir

" UI Improvements
set cursorline
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set scrolloff=8
set sidescrolloff=8
set ambiwidth=double

" Color Scheme and Highlighting
set background=dark
colorscheme desert

" Custom Color Settings
highlight Normal guibg=#1e1e1e ctermbg=233
highlight LineNr ctermfg=102 guifg=#878787 guibg=#2a2a2a ctermbg=235
highlight CursorLineNr ctermfg=81 guifg=#5fd7ff guibg=#3a3a3a ctermbg=237 cterm=bold gui=bold
highlight CursorLine guibg=#2d2d2d ctermbg=236 cterm=none
highlight Visual guibg=#404040 ctermbg=238
highlight Search guibg=#5f5f00 ctermbg=58 guifg=#ffff87 ctermfg=228
highlight Comment ctermfg=244 guifg=#808080 cterm=italic gui=italic
highlight String ctermfg=107 guifg=#87af5f
highlight Keyword ctermfg=68 guifg=#5f87d7 cterm=bold gui=bold
highlight Function ctermfg=110 guifg=#87afd7
highlight Type ctermfg=173 guifg=#d7875f
highlight StatusLine guibg=#4e4e4e ctermbg=239 guifg=#e4e4e4 ctermfg=254 cterm=bold gui=bold
highlight StatusLineNC guibg=#3a3a3a ctermbg=237 guifg=#9e9e9e ctermfg=247

" Split Management
set splitbelow
set splitright

" Key Mappings
let mapleader = ","
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Search and Replace
nnoremap <leader>h :nohlsearch<CR>
nnoremap <leader>r :%s//g<Left><Left>

" Code Folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Performance
set lazyredraw
set ttyfast

" Mouse Support
set mouse=a

" GUI Font Settings (for MacVim/GVim)
if has('gui_running')
    if has('gui_macvim')
        set guifont=SF\ Mono:h14
    elseif has('gui_gtk')
        set guifont=Consolas\ 12
    endif
endif

" File Type Specific
filetype plugin indent on
autocmd FileType html,css,javascript,json setlocal tabstop=2 shiftwidth=2
autocmd FileType python setlocal tabstop=4 shiftwidth=4
autocmd FileType make setlocal noexpandtab

" Git Integration
nnoremap <leader>gs :!git status<CR>
nnoremap <leader>gd :!git diff<CR>
nnoremap <leader>ga :!git add %<CR>
nnoremap <leader>gc :!git commit<CR>

" Quick Edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Buffer Navigation
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>

" Quick Fixes and Location List
nnoremap <leader>co :copen<CR>
nnoremap <leader>cc :cclose<CR>
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprevious<CR>

" Text Objects and Motions
nnoremap j gj
nnoremap k gk
nnoremap Y y$

" Insert Mode Mappings
inoremap jk <Esc>
inoremap <C-a> <Home>
inoremap <C-e> <End>

" Visual Mode Enhancements
vnoremap < <gv
vnoremap > >gv

" Terminal Integration (Vim 8.0+)
if has('terminal')
    nnoremap <leader>t :terminal<CR>
endif

" Auto Commands
augroup vimrc
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e
    autocmd BufNewFile,BufRead *.json setfiletype json
    autocmd BufNewFile,BufRead *.md setfiletype markdown
augroup END