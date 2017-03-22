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

" Show the first match for the pattern, while you are still typing it
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
set t_Co=256


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MAPPINGS
" cmap handles command-line mappings
" imap handles insert-only mappings
" map maps keys in normal, visual, and operator-pending mode
" map! maps keys in Vim's command and insert modes
" nmap maps keys in normal mode only
" omap maps keys in operator-pending mode only
" vmap maps keys in visual mode only
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

" Remove Highlighting
"noremap <F5> :noh<CR>

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
au BufRead,BufNewFile *.vcl set ft=vcl syntax=vcl
au BufRead,BufNewFile *.vim-plugins set ft=vim syntax=vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LOAD PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	source ~/.vim-plugins
call vundle#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGIN CONFIGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NerdTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Open NERDTree when no file on command line
function! StartUp()
 if 0 == argc()
	 NERDTree
	 call feedkeys("\<C-W>l:q\<Enter>","t")
 end
endfunction
au VimEnter * call StartUp()
let NERDTreeShowLineNumbers=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" Vimify NerdTree Tab Navigation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-l> gt
nmap <C-h> gT


" CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:20,results:20'
let g:ctrlp_by_filename = 1
let g:ctrlp_open_new_file = 't'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](plugins|uploads|images|backups|cache|ewww|upgrade|w3tc-config)$',
  \ }
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }
nmap <Leader>re :CtrlPMRU<CR>


" EasyMotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"EasyMotion Search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

"Override s for EasyMotion Search
nmap s <Plug>(easymotion-overwin-f)

"Override w for EasyMotion Word Search
nmap w <Plug>(easymotion-w)

"Enable Smartcase
let g:EasyMotion_smartcase = 1


" Snipmate
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <C-j> <esc>a<Plug>snipMateNextOrTrigger


" Tabular
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap <Leader>aa :Tabularize /=><CR>
nmap <Leader>aa :Tabularize /=><CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a: :Tabularize /:<CR>


" Vim Fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gpm :!git push origin master<CR>
nmap <Leader>gplm :!git pull origin master<CR>


" Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']


" Split/Join
" <Leader>S - split
" <Leader>J - join
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:splitjoin_split_mapping = '<Leader>S'
let g:splitjoin_join_mapping  = '<Leader>J'


" Lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noshowmode
set laststatus=2
source ~/.vim/lightline-colors/peej.vim

let g:lightline = {
\ 'colorscheme': 'peej',
\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
\ 'subseparator': { 'left': "", 'right': "" },
\ 'active': {
\   'left': [ [ 'mode', 'paste' ], [ 'fugitive' ], [ 'gitgutter' ] ],
\   'right': [ [ 'lineinfo' ], [ 'hostname' ], [ 'modified', 'relativepath' ] ]
\ },
\ 'component_function': {
\   'fugitive': 'LightlineFugitive',
\   'gitgutter': 'LightlineGitGutter',
\   'hostname' : 'LightlineHostname'
\ },
\ 'tab' : {
\   'active': [ 'filename', 'modified' ],
\   'inactive': [ 'filename', 'modified' ] 
\ },
\ 'component' : {
\   'lineinfo': '%p%% : %l/%L'
\ },
\}

function LightlineHostname()
    return hostname()
endfunction

function! LightlineFugitive()
    return exists('*fugitive#head') ? printf( '%s%s', "\uE0A0 ", fugitive#head()) : ''
endfunction

function LightlineGitGutter() 
    let hunks = exists('*GitGutterGetHunkSummary') ? GitGutterGetHunkSummary() : ''
    let string = ''
    if !empty(hunks)
        for i in [0, 1, 2]
            if (hunks[i] > 0)
                if (i == 0)
                    let symbol = '+'
                elseif (i == 1)
                    let symbol = '~'
                elseif (i == 2)
                    let symbol = '-'
                endif
                let string .= printf('%s%s ', symbol, hunks[i])
            endif
        endfor
    endif
    if (string == '')
        return
    else
        return string
    endif
endfunction

" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set laststatus=2
"let g:airline_powerline_fonts=1
"let g:airline_theme='bubblegum'
"let g:airline#extensions#whitespace#enabled = 0
"highlight clear SignColumn
"
"if 'pj-dev-1' != hostname()
"    let g:airline_theme='light'
"end
"
"
"function! AirlineInit() 
"  let g:airline_section_a = airline#section#create(['mode', ' ', 'paste'])
"  let g:airline_section_b = airline#section#create(['branch'])
"  let g:airline_section_c = airline#section#create(['hunks'])
"  let g:airline_section_x = airline#section#create(['%f'])
"  let g:airline_section_y = airline#section#create(['%{hostname()}'])
"  let g:airline_section_z = airline#section#create(['%p%% : %l/%L'])
"  call airline#update_statusline()
"endfunction
"autocmd VimEnter * call AirlineInit()
