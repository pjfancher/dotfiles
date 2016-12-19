"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GENERAL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enables Plugins, File Indention detection and Filetype detection
filetype plugin indent on

" Necessary for lots of cool vim things
set nocompatible

" Show number column
set number

" Make backspace work like most other apps
set backspace=2

" Enables CSS auto-completion
set omnifunc=csscomplete#CompleteCSS

" Sets your path variable to current directory
"set path=$PWD/**
set path=.,**

" Allows pastetoggle to work in Insert mode
set pastetoggle=<F2>

" Set to auto read when a file is changed from the outside
set autoread

" Always show current position
set ruler

" Set update delay to 250ms
set updatetime=250

" Set ctags location
set tags=./.git/tags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SEARCHING - help from http://amix.dk/vim/vimrc.html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Makes search act like search in modern browsers
set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TEXT, TAB & INDENT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces insted of tabs
set expandtab

" Be smart when using tabs
set	smarttab		

" 1 Tab == 4spaces
set tabstop=4
set shiftwidth=4

" Turns on auto-indentation
set ai

" does the right thing (mostly) in programs
set smartindent

" highlight on the line your cursor is currently on.
set cursorline


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => COLORS & FONTS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

" Set colorscheme
set background=dark
colorscheme wombat256mod

" Set utf8 as standard encoding
set encoding=utf8
"set guifont=Inconsolata\ for\ Powerline\ Nerd\ Font\ Complete\ Mono\ 11
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12

" Get 256 Colors
let &t_Co=256


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <LEADER>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"

" Edit and auto-update this config file and plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent>  ;v  :tabnew $VIMRC<CR>

" Quickfix for TO-DOs and FIX-MEs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>t :Ag \(TODO\\|FIXME\) themes/<CR>

" Find/Edit/Buffers Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <Leader>f :find
noremap <Leader>e :edit 
noremap <Leader>B :buffers<CR>
noremap <Leader>b :buffer 

" Insert Line Above/Below
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>o o<Esc>k
nmap <Leader>O O<Esc>j

" Highlight Current Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader><Leader> V

" Dev Debug Snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>pr vavyopr<Tab><Space><Esc>p
nmap <Leader>ppr vavyoppr<Tab><Space><Esc>p

" Quick Fix Window Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Home> :cp<CR>
nnoremap <End>  :cn<CR>
nnoremap <bar>  :ccl<CR>

" Insert newline stay in NORMAL mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <S-Enter> O<Esc>
nmap <CR> O<Esc>

" Map jk kj to Esc key
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap jk <esc>
inoremap kj <esc>

" Write/Quit Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cmap W w
cmap Q q
noremap <Leader>w :w<CR>
noremap <Leader>q :q<CR>
noremap <Leader>wq :wq<CR>

" move vertically by visual line  -- won't skip over wrapped lines
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap B ^
nnoremap E $

" Shift to move 5 spaces
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap H 5h
xmap H 5h
nmap J 5j
xmap J 5j
nmap K 5k
xmap K 5k
nmap L 5l
xmap L 5l

" Move in Insert Mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <C-h> <C-o>h
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-l> <C-o>l

" <Leader>r - Redraw Screen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>r :redraw!<CR>

" <Leader>% - Search and Replace Highlighted Text
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <Leader>% "hy:%s/<C-r>h//gc<left><left><left>

" <Ctrl>s - Save while in Insert Mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <C-s> <c-o>:w<CR>

" ctags - Open definition in new tab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open definition in new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => F KEYS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Build current site assets
noremap <F1> :!./build-assets<CR>

" Toggle paste mode
noremap <F2> :set invpaste paste?<CR>

" Toggle line numbers
noremap <F3> :set nonumber!<CR>

" Add CSS closing comment
noremap <F4>  %^y$%a// pxx

" Source current file
noremap <F5> :source %<CR>

" Converts echo to `fwrite( $stdout )`
noremap <F6> ^dwifwrite( $stdout, <Esc>$i )<Esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FILES, BACKUPS & UNDO
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backups off
set nobackup
set noswapfile
set nowb

"  Sets undo history size
set history=1000

" Persistent UNDO
if exists("&undodir")
	set undofile                " Save undo's after file closes
	set undodir=~/.vim/undo     " where to save undo histories
	set undolevels=1000         " How many undos
	set undoreload=10000        " number of lines to save for undo
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => AUTOCOMMANDS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Save folds
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" Redraw screen on save
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufWritePost * :redraw!

" Set Filetypes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.md set filetype=markdown syntax=markdown
au BufRead,BufNewFile *.markdown set filetype=markdown syntax=markdown
au BufNewFile,BufRead *.less set filetype=less syntax=less
au BufRead,BufNewFile *.js set ft=javascript syntax=javascript
au BufRead,BufNewFile *.json set ft=json syntax=javascript
au BufRead,BufNewFile *.jade set ft=jade syntax=jade
au BufRead,BufNewFile *.go set ft=go syntax=go


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	source ~/.vim-plugins
call vundle#end()
