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
" Be smart when using tabs
"set	smarttab		

" 1 Tab == 4 spaces
set tabstop=4
set shiftwidth=4

" Does the right thing (mostly) in programs
set smartindent
"
" Turns on auto-indentation
set autoindent

" Highlight on the line your cursor is currently on.
set cursorline

" Show tabs, spaces, eol as characters when :set list is enabled
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<



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
:map <F12> <nop>
:map! <F12> <nop>
let maplocalleader = "\<F12>"

" Quickfix for TO-DOs and FIX-MEs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>t :Ag \(TODO\\|FIXME\) themes/<CR>

" Find/Edit/Buffers Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <Leader>B :buffers<CR>
noremap <Leader>b :buffer 

" Insert Line Above/Below
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>o o<Esc>k
nmap <Leader>O O<Esc>j

" Dev Debug Snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>d vavyod<C-j><Esc>p
nmap <LocalLeader>d vavyod<C-j><Esc>p
nmap <Leader>pd vavyopd<C-j><Esc>p
nmap <LocalLeader>pd vavyopd<C-j><Esc>p

nmap <Leader>pr vavyod<C-j><Esc>p
nmap <Leader>ppr vavyopd<C-j><Esc>p

" Quick Fix Window Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Home> :cp<CR>
nnoremap <End>	:cn<CR>
nnoremap <bar>	:ccl<CR>

" Insert newline stay in NORMAL mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <S-Enter> O<Esc>
nmap <CR> O<Esc>

" Map jk kj to Esc key
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap jk <esc>
inoremap kj <esc>

" Indent Line Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>, V<<esc>
nmap <LocalLeader>, V<<esc>
nmap <Leader>. V><esc>
nmap <LocalLeader>. V><esc>


" Write/Quit Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cmap W w
cmap Q q
cmap q1 q!

noremap <Leader>w :w<CR>
imap <LocalLeader>w <esc>:w<CR>i

noremap <Leader>q :q<CR>
imap <LocalLeader>q <esc>:q<CR>

noremap <Leader>wq :wq<CR>
imap <LocalLeader>wq <esc>:wq<CR>


" Paste
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"imap <LocalLeader>p :set paste!<CR>
imap <LocalLeader>p <esc>:set invpaste paste?<CR>i
nmap <LocalLeader>p :set paste!<CR>
vmap <LocalLeader>p :set paste!<CR>
nmap <Leader>p :set paste!<CR>
vmap <Leader>p :set paste!<CR>


" Add ; at end-of-line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <LocalLeader>; <Esc>A;
nmap <LocalLeader>; <Esc>A;
nmap <Leader>; <Esc>A;


" NERDTree Tab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <LocalLeader>t <Esc>gti
nmap <LocalLeader>t gt
vmap <LocalLeader>t gt

imap <LocalLeader>r <Esc>gTi
nmap <LocalLeader>r gT
vmap <LocalLeader>r gT


" Insert Mode LocalLeader Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Move vertically by visual line  -- won't skip over wrapped lines
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap j gj
nnoremap k gk

" Move to beginning/end of line
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
" => F KEYS -- with Leader/LocalLeader backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F1 
" Write File & Build Local Assets
"noremap <F1> :w<CR>:!./build-assets<CR>
let g:VimuxHeight = "10"
noremap <F1> :w<CR>:VimuxPromptCommand<CR>home && clear && ba<CR>
nmap <Leader>b <F1>
map <LocalLeader>b <esc><F1>
map <LocalLeader><LocalLeader> <esc><F1>
imap <LocalLeader><LocalLeader> <esc><F1>

" F2 -- Toggle paste mode
"noremap <F2> :set invpaste paste?<CR>
"nmap <Leader>p <F2>
"map <LocalLeader>p <esc><F2>

" F3 -- Toggle line numbers
noremap <F3> :set nonumber!<CR>
nmap <Leader>n <F3>
map <LocalLeader>n <esc><F3>

" F4 -- Add CSS closing comment
noremap <F4>  %^y$%a // <Esc>pxx
nmap <Leader>c <F4>
map <LocalLeader>c <esc><F4>
imap <LocalLeader>c <esc><F4>a

" Show all non-white space characters
noremap <F5> :set list!<CR>
nmap <Leader>v <F5>
map <LocalLeader>v <esc><F5>
imap <LocalLeader>v <esc><F5>

" Converts echo to `fwrite( $stdout )`
noremap <F6> ^dwifwrite( $stdout, <Esc>$i )<Esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SPLITS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

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
set undofile				" Save undo's after file closes
set undodir=~/.vim/undodir	" where to save undo histories
set undolevels=1000			" How many undos
set undoreload=10000		" number of lines to save for undo


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Convert Spaces to Tabs
:command T call SetTabs()
function! SetTabs()
	set list
	set tabstop=4
	set shiftwidth=4
	set noexpandtab
	%retab!
endfunction

" Convert Tabs to JS style Tabs
:command JT call SetJSTabs()
function! SetJSTabs()
	set list
	set tabstop=2
	set shiftwidth=2
	set noexpandtab
	%retab!
endfunction

" Remove Trailing Whitespace
:command S call RemoveSpaces()
function! RemoveSpaces()
	set list
	%s/\s\+$//e
endfunction

" Set Tabs and Remove Spaces
:command Format call SetTabs() | call RemoveSpaces()


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

" Remove trailing whitespace on save
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd Filetype php,js,sh,yml autocmd BufWritePre <buffer> %s/\s\+$//e


" Custom Settings for Specific	Filetypes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.md set filetype=markdown syntax=markdown
au BufRead,BufNewFile *.markdown set filetype=markdown syntax=markdown
au BufRead,BufNewFile *.less set filetype=less syntax=less tabstop=4
au BufRead,BufNewFile *.scss set filetype=scss syntax=scss tabstop=4
au BufRead,BufNewFile *.sass set filetype=scss syntax=scss tabstop=4
au BufRead,BufNewFile *.js set ft=javascript syntax=javascript tabstop=2 shiftwidth=2 expandtab
au BufRead,BufNewFile *.json set ft=json syntax=javascript
au BufRead,BufNewFile *.jade set ft=pug syntax=pug
au BufRead,BufNewFile *.pug set ft=pug syntax=pug
au BufRead,BufNewFile *.go set ft=go syntax=go
au BufRead,BufNewFile *.vcl set ft=vcl syntax=vcl
au BufRead,BufNewFile *.vim-plugins set ft=vim syntax=vim
au BufRead,BufNewFile *.snippets set ft=snippets syntax=snippets
au BufRead,BufNewFile *.php set tabstop=4
au BufRead,BufNewFile *.py set filetype=python syntax=python tabstop=4

" The following adds a potential replacement on 'p' (ASCII 112) in PHP files.
" The carriage return will be replaced by the original text.
" This can be used in a PHP file as in the following example.
" :echo char2nr("p") to get ASCII
"
"	Old text				  Command	  New text ~
"	print 'Hello *world!'	  yssp		  <?php print 'Hello world!' ?>
au FileType php let b:surround_112 = "<?php \r ?>"


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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Open NERDTree when no file on command line
function! StartUp()
 if 0 == argc()
	 NERDTree
	 call feedkeys("\<C-W>l:q\<Enter>","t")
 end
endfunction
au VimEnter * call StartUp()

" Vimify NerdTree Tab Navigation
" nmap <C-l> gt
" nmap <C-h> gT

" NERDTree Dir Arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" NERDTree Show Line Numbers
let NERDTreeShowLineNumbers=1

" NERDTree hide 'Press ? for Help' and up directory
let NERDTreeMinimalUI=1

" Disable collapse on the same line directories that have only one child directory
let NERDTreeCascadeSingleChildDir=0

" NERDTree Basic Colors
hi NERDTreeDir		ctermfg=68
hi NERDTreeDirSlash ctermfg=68
hi NERDTreeOpenable ctermfg=68
hi NERDTreeClosable ctermfg=68
hi NERDTreeCWD		ctermfg=65 ctermbg=232
hi NERDTreeExecFile ctermfg=83

" NERDTree Filetype Highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	exec 'highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg
	exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" NERDTree Filetype Colors
call NERDTreeHighlightFile('lock', 'white', '196', 'white', 'red')
call NERDTreeHighlightFile('php', '153', 'none', '153', 'none')
call NERDTreeHighlightFile('html', '151', 'none', '151', 'none')
call NERDTreeHighlightFile('css', '157', 'none', '222', 'none')
call NERDTreeHighlightFile('less', '157', 'none', '222', 'none')
call NERDTreeHighlightFile('scss', '157', 'none', '222', 'none')
call NERDTreeHighlightFile('sass', '157', 'none', '222', 'none')
call NERDTreeHighlightFile('js', '114', 'none', '114', 'none')
call NERDTreeHighlightFile('json', '029', 'none', '029', 'none')
call NERDTreeHighlightFile('gif', '198', 'none', '198', 'none')
call NERDTreeHighlightFile('jpg', '198', 'none', '198', 'none')
call NERDTreeHighlightFile('jpeg', '198', 'none', '198', 'none')
call NERDTreeHighlightFile('png', '198', 'none', '198', 'none')

" NERDTree Toggle
map <LocalLeader><Tab> :NERDTreeToggle<CR>
nmap <Leader><Tab> :NERDTreeToggle<CR>
vmap <Leader><Tab> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <LocalLeader><Space> :call NERDComment(0,"toggle")<CR>
vnoremap <LocalLeader><Space> :call NERDComment(0,"toggle")<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:20,results:20'
let g:ctrlp_by_filename = 1
let g:ctrlp_open_new_file = 't'
let g:ctrlp_custom_ignore = {
  \ 'dir':	'\v[\/](plugins|uploads|images|backups|cache|ewww|upgrade|w3tc-config)$',
  \ }
let g:ctrlp_prompt_mappings = {
	\ 'AcceptSelection("e")': ['<c-t>'],
	\ 'AcceptSelection("t")': ['<cr>'],
	\ }
nmap <Leader>re :CtrlPMRU<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe Menu Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight Pmenu ctermfg=109 ctermbg=236
highlight PmenuSel ctermfg=16 ctermbg=109
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyMotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"EasyMotion Search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

"Override s for EasyMotion Search
nmap s <Plug>(easymotion-overwin-f2)

"Override w for EasyMotion Word Search
nmap w <Plug>(easymotion-w)

"Enable Smartcase
let g:EasyMotion_smartcase = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ultisnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<C-j>"
imap <LocalLeader><Space> <C-j>

let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabular
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Align =
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>aa :Tabularize /=>.*/<CR>
map <Leader>a= :Tabularize /=.*/<CR>
map <Leader>= :Tabularize /=.*/<CR>
map <LocalLeader>= :Tabularize /=.*/<CR>

" Align :
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>: vi{:Tabularize /:.*/<CR>
map <LocalLeader>: vi{:Tabularize /:.*/<CR>
imap <LocalLeader>: <esc>vi{:Tabularize /:.*/<CR>i

vmap <Leader>a: :Tabularize /:.*/<CR>
nmap <Leader>a: :Tabularize /:.*/<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gpm :!git push origin master<CR>
nmap <Leader>gplm :!git pull origin master<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>t :TagbarOpenAutoClose<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Polygot
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" graphql was causing errors opening js files. Disabling.
let g:polyglot_disabled = ['graphql']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Split/Join
" <Leader>S - split
" <Leader>J - join
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:splitjoin_split_mapping = '<Leader>S'
let g:splitjoin_join_mapping  = '<Leader>J'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
\	'left': [ [ 'mode', 'paste' ], [ 'fugitive' ], [ 'gitgutter' ] ],
\	'right': [ [ 'lineinfo' ], [ 'hostname' ], [ 'modified', 'relativepath' ] ]
\ },
\ 'component_function': {
\	'fugitive': 'LightlineFugitive',
\	'gitgutter': 'LightlineGitGutter',
\	'hostname' : 'LightlineHostname'
\ },
\ 'tab' : {
\	'active': [ 'filename', 'modified' ],
\	'inactive': [ 'filename', 'modified' ] 
\ },
\ 'component' : {
\	'lineinfo': '%p%% : %l/%L'
\ },
\}

" Lightline Hostname
function LightlineHostname()
	return hostname()
endfunction

" Lightline Fugitive
function! LightlineFugitive()
	return exists('*fugitive#head') ? printf( '%s%s', "\uE0A0 ", fugitive#head()) : ''
endfunction

" Lightline GitGutter
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
