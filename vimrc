call pathogen#infect()      "Executes the pathogen plugin, which loads other plugins
let mapleader=","           "Changes Leader key into a comma instead of a backslash
let maplocalleader='\'      "Changes the maplocalleader
set nocompatible            "Prefents VIM from being nerfed into acting like VI
set viminfo='1000,f1,:1000,/1000
set history=500

" Source the vimrc file after saving it
autocmd BufWritePost .vimrc source $MYVIMRC
" Fast edit the .vimrc file using ',x'
nnoremap <Leader>x :tabedit $MYVIMRC<CR>
" Fast edit the todo list file using ',d'
nnoremap <Leader>d :tabedit $HOME/todo_list<CR>
nnoremap <Leader>th :tabedit /etc/hosts<CR>
nnoremap <Leader>nn :tabn<CR>
nnoremap <Leader>pp :tabp<CR>
nnoremap <Leader>tt :tabnew<CR>

set autoread " Set autoread when a file is changed outside
set autowrite " Write on make/shell commands

"set clipboard+=unnamed " Yanks go on clipboard instead
"set spell " Spell checking on
set modeline " Turn on modeline
set encoding=utf8 " Set utf-8 encoding
set termencoding=utf8
set fencs=utf8,gbk,gb2312,gb18030,cp936 
set completeopt+=longest " Optimize auto complete
set completeopt-=preview " Optimize auto complete

set backup " Set backup
"set undofile " Set undo

au FileType php set omnifunc=phpcomplete#CompletePHP

"------  Visual Options  ------
set guioptions=egmt         "remove toolbar, scrollbars
syntax on                   "Enables syntax highlighting
set nu                      "Enable Line Numbers
set wrap                  	"Enable word wrap
set vb                      "Visual bell instead of beeps
set ruler                   "Displays cursor position on bottom right of screen
set statusline=%<%f\ %h%m%r%=%{fugitive#statusline()}\ \ %-14.(%l,%c%V%)\ %P
let g:buftabs_only_basename=1
let g:buftabs_marker_modified = "+"

"------  Behavior  ------
set tabstop=4               "tab = 4 spaces
set shiftwidth=4            "Indent to four spaces
set hidden                  "Switch between unsaved buffers w/o needing to save, preserves history
filetype indent on          "Syntax Highlight
filetype plugin on          "Needed for snipMate
set autoindent              "Autoindent
set cursorline                  "Highlight background of current line
nnoremap <Leader>vv :set mouse=v<CR>
nnoremap <Leader>aa :set mouse=a<CR>
"set expandtab               "Use spaces instead of tabs
"Ignore these files when completing names
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,node_modules/*

"------  Special Coffee Behavior ------
au BufNewFile,BufReadPost *.coffee set shiftwidth=2 softtabstop=2 expandtab
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
au BufWritePost *.coffee silent CoffeeMake!

"------  Searching  ------
set incsearch               "Search while typing
set ignorecase              "Case Insensitive Searching
set smartcase               "Lowercase = case insensitive, any uppercase = case sensitive
set hlsearch                "Highlight all search results
"Following line clears the search highlights when pressing Lb
nnoremap <leader>b :nohlsearch<CR>
" http://www.vim.org/scripts/script.php?script_id=2572
noremap <leader>a :Ack 
noremap <leader>A <C-w>j<C-w>c<C-w>l
let g:ackprg="ack -H --nocolor --nogroup --column --type-add php=.tpl"

"------  Replacing ------
"type S, then type what you're looking for, a /, and what to replace it with
nmap S :%s//g<LEFT><LEFT>
vmap S :s//g<LEFT><LEFT>

"------  NERDTree Options  ------
let NERDTreeIgnore=['CVS','\.dSYM$']
let NERDTreeChDirMode=2     "setting root dir in NT also sets VIM's cd
noremap <silent> <Leader>n :NERDTreeToggle<CR>
" These prevent accidentally loading files while in the NERDTree panel
autocmd FileType nerdtree noremap <buffer> <c-left> <nop>
autocmd FileType nerdtree noremap <buffer> <c-h> <nop>
autocmd FileType nerdtree noremap <buffer> <c-right> <nop>
autocmd FileType nerdtree noremap <buffer> <c-l> <nop>

"------  Tagbar Options  ------
" http://adamyoung.net/Exuberant-Ctags-OS-X
" http://www.vim.org/scripts/script.php?script_id=273
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=26
noremap <silent> <Leader>y :TagbarToggle<CR>

"------  Buffers  ------
" Ctrl Left & Right move between buffers
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-right> :bnext<CR>
noremap <silent> <C-l> :bnext<CR>
" Closes the current buffer
nnoremap <silent> <Leader>q :Bclose<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

" Closes the current window
nnoremap <silent> <Leader>Q <C-w>c

"------  Fugitive  ------ 
"https://github.com/tpope/vim-fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gr :Gremove<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gm :Gmove 
nnoremap <Leader>gp :Ggrep 
nnoremap <Leader>gR :Gread<CR>
nnoremap <Leader>gg :Git 
nnoremap <Leader>gd :Gdiff<CR>

"------  Moving Between Windows  ------
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>wo <C-w>o
nnoremap <Leader>wv <C-w>v<C-w>l
nnoremap <Leader>ws <C-w>s
nnoremap <Leader>ww <C-w><C-w>

" Opens an edit command with the path of the currently edited file filled in Normal mode: <Leader>ee
map <Leader>ee :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Edit and Reload .vimrc files
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>es :so $MYVIMRC<CR>

" When pressing <leader>cd switch to the directory of the open buffer
"map <Leader>cd :cd %:p:h<CR>
" ,ct = Builds ctags
map <Leader>ct :! /usr/bin/ctags -R *<CR>

" ,v = Paste
map <Leader>v "+gP
" ,c = Copy
map <Leader>c "+y
" F2 = Paste Toggle (in insert mode, pasting indented text behavior changes)
set pastetoggle=<F2>
" ,T = Delete all Trailing space in file
map <Leader>T :%s/\s\+$//<CR>
" ,U = Deletes Unwanted empty lines
map <Leader>U :g/^$/d<CR>
" ,R = Converts tabs to spaces in document
map <Leader>R :retab<CR>
" ,p = Runs PHP lint checker on current file
map <Leader>p :! php -l %<CR>
" ,P = Runs PHP and executes the current file
map <Leader>P :! php -q %<CR>
" ,L = Toggle line numbers
map <Leader>L :set invnumber<CR>

" Deletes trailing space in file upon write
" autocmd BufWritePre * :%s/\s\+$//e

map <Leader>? :Helptags<CR>

" Markdown
augroup ft_markdown
	autocmd!
	" Use <localLeader>1/2/3/4/5/6 to add headings
	autocmd Filetype markdown nnoremap <buffer> <localLeader>1 I# <ESC>
	autocmd Filetype markdown nnoremap <buffer> <localLeader>2 I## <ESC>
	autocmd Filetype markdown nnoremap <buffer> <localLeader>3 I### <ESC>
	autocmd Filetype markdown nnoremap <buffer> <localLeader>4 I#### <ESC>
	autocmd Filetype markdown nnoremap <buffer> <localLeader>5 I##### <ESC>
	autocmd Filetype markdown nnoremap <buffer> <localLeader>6 I###### <ESC>
	" Use <LocalLeader>b to add blockquotes in normal and visual mode
	autocmd Filetype markdown nnoremap <buffer> <localLeader>b I> <ESC>
	autocmd Filetype markdown vnoremap <buffer> <localLeader>b :s/^/> /<CR>
	" Use <localLeader>ul and <localLeader>ol to add list symbols in visual mode
	autocmd Filetype markdown vnoremap <buffer> <localLeader>ul :s/^/* /<CR>
	autocmd Filetype markdown vnoremap <buffer> <LocalLeader>ol :s/^/\=(line(".")-line("'<")+1).'.  '/<CR>
	" Use <localLeader>e1/2/3 to add emphasis symbols
	autocmd Filetype markdown nnoremap <buffer> <localLeader>e1 I*<ESC>A*<ESC>
	autocmd Filetype markdown nnoremap <buffer> <localLeader>e2 I**<ESC>A**<ESC>
	autocmd Filetype markdown nnoremap <buffer> <localLeader>e3 I***<ESC>A***<ESC>
	" Use <Leader>P to preview markdown file in browser
	autocmd Filetype markdown nnoremap <buffer> <Leader>P :MarkdownPreview<CR>
augroup END

" JSON
augroup ft_json
	autocmd!
	" Disable concealing of double quotes
	autocmd filetype json setlocal conceallevel=0
	" Added folding of {...} and [...] blocks
	autocmd filetype json setlocal foldmethod=syntax
augroup END

" LESS
augroup ft_less
	autocmd!
	autocmd filetype less nnoremap <buffer> <Leader>r :w <BAR> !lessc % > %:t:r.css<CR><Space>
augroup END

" PHP
set runtimepath+=$HOME/.vim/php
autocmd BufNewFile,Bufread *.ros,*.inc,*.php set keywordprg="help"
augroup ft_php

	" phpdocumentor
	source $HOME/.vim/bundle/phpdocumentor/php-doc.vim 
	inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
	nnoremap <C-P> :call PhpDocSingle()<CR> 
	vnoremap <C-P> :call PhpDocRange()<CR> 

	if filereadable(expand("$HOME/.vim/dict/php_funclist.txt"))
		function! AddPHPFuncList() 
			set dictionary-=$HOME/.vim/dict/php_funclist.txt dictionary+=$HOME/.vim/dict/php_funclist.txt
			set complete-=k complete+=k
		endfunction
		autocmd!
		autocmd filetype php call AddPHPFuncList()
	endif
augroup END

" Perl
augroup ft_perl
	let perl_include_pod=1
	let perl_extended_vars=1
	let perl_sync_dist=250
	autocmd!
	autocmd filetype perl setlocal keywordprg=perldoc\ -f
augroup END

" Python
augroup ft_python
	" Indent Python in the Google way.
	let s:maxoff = 50 " maximum number of lines to look backwards.
	function! GetGooglePythonIndent(lnum)
		" Indent inside parens.
		" Align with the open paren unless it is at the end of the line.
		" E.g.
		" open_paren_not_at_EOL(100,
		" (200,
		" 300),
		" 400)
		" open_paren_at_EOL(
		" 100, 200, 300, 400)
		call cursor(a:lnum, 1)
		let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
					\ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
					\ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
					\ .  " =~ '\\(Comment\\|String\\)$'")
		if par_line > 0
			call cursor(par_line, 1)
			if par_col != col("$") - 1
				return par_col
			endif
		endif
		" Delegate the rest to the original function.
		return GetPythonIndent(a:lnum)
	endfunction

	function!  ChoosePythonCompiler()
		echo "Please choose python compiler:\n"
		echo "1.  Python2+\n"
		echo "2.  Python3+\n"
		let flag=getchar()
		if flag==49
			call SingleCompile#ChooseCompiler('python', 'python')
			execute 'SingleCompileRun'
		elseif flag==50
			call SingleCompile#ChooseCompiler('python', 'python3')
			execute 'SingleCompileRun'
		endif
	endfunction

	let pyindent_nested_paren="&sw*2"
	let pyindent_open_paren="&sw*2"

	autocmd!
	autocmd filetype python setlocal indentexpr=GetGooglePythonIndent(v:lnum)
	autocmd filetype python nnoremap <buffer> <Leader>r :call ChoosePythonCompiler()<CR>

augroup END


" Ruby
augroup ft_ruby
	autocmd!
	autocmd filetype ruby setlocal shiftwidth=2 softtabstop=2
augroup END

nnoremap <silent>\d :colorscheme desert<CR>
nnoremap <silent>\j :colorscheme jellybeans<CR>
nnoremap <silent>\b :colorscheme darkblue<CR>
nnoremap <silent>\m :colorscheme Mustang<CR>
nnoremap <silent>\s :colorscheme solarized<CR>
nnoremap <silent>\i :colorscheme ir_black<CR>

" ======= 引号 && 括号自动匹配 ======= "
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {}<ESC>i
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i
":inoremap ` ``<ESC>i
"function ClosePair(char)
"	if getline('.')[col('.')- 1] == a:char
"		return "\<Right>"
"	else
"		return a:char
"	endif
"endf

if has("gui_running")
    set cursorline                  "Highlight background of current line
    autocmd VimEnter * NERDTree     "run nerdtree
    "autocmd VimEnter * TagbarOpen
	colorscheme ir_black

    " Show tabs and newline characters with ,s
    nmap <Leader>s :set list!<CR>
	set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×,eol:¬
    "Invisible character colors
    highlight NonText guifg=#4a4a59
    highlight SpecialKey guifg=#4a4a59
else
    set t_Co=256
    colorscheme Mustang             "This theme actually works in 256, ir_black doesn't
	set mouse=a						"This allows mouse scrolling in terminal, and selection of text
endif

if has("gui_macvim") "Use Experimental Renderer option must be enabled for transparency
	"set guifont=Monaco:h14
	set guifont=Monaco:h10
	set noantialias
	set transparency=15
    " Swipe to move between bufers :D
    map <SwipeLeft> :bprev<CR>
    map <SwipeRight> :bnext<CR>
endif

if filereadable($HOME.'/.vimrc_local')
    source $HOME/.vimrc_local
endif

" 插入时间
imap <silent> <C-D><C-D> <C-R>=strftime("%Y-%b-%e")<CR>
imap <silent> <C-T><C-T> <C-R>=strftime("%l:%M %p")<CR>

let g:startify_list_order = ['files', 'dir', 'bookmarks', 'sessions']
let g:startify_custom_header = [
            \"       ./\   _                  ",
            \"  c ..'D> `'//...........'`.    ",
            \"  :        //            :`     ",
            \"  :       //             :      ",
            \"  '..... // mini-dog-vim :      ",
            \"   ^^^^^``:              ;      ",
            \"          :             .'      ",
            \"          : :':'''''':`: `. jgs ",
            \"          ''''``      ``'''     ",
            \]

let g:startify_custom_footer = "   This configuration is maintained by wuyong(wuyong@sogou-inc.com) and other contributors. Thanks!"
