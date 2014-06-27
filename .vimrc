"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim Config File
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""
"" GENERAL
"""""""""""""""""""""""""""""""""""""""
"" Vi-incompatible mode (vim); must be first setting in file.
set nocompatible

"" Number of lines of history stored in buffer
set history=1000

"" Enable filetype plugins
filetype plugin on
filetype indent on

"" Set to autoread when a file is changed form the outside
set autoread

"" Set shell to interactive mode
set shellcmdflag=-ic

"" File backup
set writebackup
"" No backup
"set nobackup



"""""""""""""""""""""""""""""""""""""""
"" USER INTERFACE
"""""""""""""""""""""""""""""""""""""""
"" File completion settings
set wildmenu
set wildmode=list:longest
"" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"" Display cursor location
set ruler

"" Set cursor distance from top/bottom at which buffer is scrolled
set so=5

"" Set command bar height
set cmdheight=2

"" Hide buffer if it is abandoned
set hid

"" Enable normal backspace in insert mode
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

"" Searching
"" Do not ignore case
set noignorecase
"" Smart case
set smartcase
"" Incremental search
set incsearch
"" Highlight search results
set hlsearch
"set nohlsearch
"" Turn on magic regexp
set magic

"" No redraw for macro execution (improves performance)
set lazyredraw

"" Matching brackets
"" Show matching brackets
set showmatch
"" Time to show matching brackets
set mat=2

"" Error indicator
"" Silence bell
set noerrorbells
"" No visual error bell
set novisualbell
set t_vb=
set tm=500

"" Update window title
set title

"" Display current command
set showcmd

"" Short message prompts
"set shortmess=atI

"" Remember marks, registers, searches, buffer list
set viminfo='20,<50,s10,h,%

"" Display line numbers
set number

"" Set extra options when in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions+=e
  set t_Co=256
  set guilabel=%M\ %t
endif

"" Autocomplete
set ofu=syntaxcomplete#Complete



"""""""""""""""""""""""""""""""""""""""
"" COLORS AND FONTS
"""""""""""""""""""""""""""""""""""""""
"" Syntax highlighting
syntax enable
"" Set colorscheme
set background=dark
colorscheme slate
"colorscheme solarized

"" Set encoding
set encoding=utf8

"" Use Unix as standard file type
set ffs=unix,dos,mac



"""""""""""""""""""""""""""""""""""""""
"" INDENTING, TABS, LINES
"""""""""""""""""""""""""""""""""""""""
"" Indenting
"" Autoindent
set autoindent
"" No 'smart' indenting
set nosmartindent

"" Tabs
"" Use spaces instead of tabs
set expandtab
set smarttab
"" ...except for make files (they require tabs)
autocmd FileType make setlocal noexpandtab
"" Tab sizes
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround

"" Lines
"" Auto linebreak after a number of characters
"set linebreak
"" Textwidth for pasting (set to 0 anyway if paste is on)
"set textwidth=500
"" Color 80th column if possible, or highlight lines that exceed 80 chars
if exists('+colorcolumn')
  set colorcolumn=80
else
  autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif



"""""""""""""""""""""""""""""""""""""""
"" NAVIGATION AND WINDOWS
"""""""""""""""""""""""""""""""""""""""
"" Treat long lines as break lines for easier navigation
map j gj
map k gk
map <DOWN> gj
map <UP> gk

"" Enable Enter and Delete in normal mode
function! Delete_key(...)
  let line=getline(".")
  if line=~'^\s*$'
    execute "normal dd"
    return
  endif
  let column = col(".")
  let line_len = strlen(line)
  let first_or_end = 0
  if column == 1 || column == line_len
    let first_or_end = 1
  endif
  execute "normal i\<DEL>\<ESC>"
  if first_or_end == 0
    execute "normal l"
  endif
endfunction
nnoremap <silent> <DEL> :call Delete_key()<CR>
nnoremap <silent> <CR> i<CR><Esc>

"" Set Shift-Enter to insert line above
nnoremap <S-Enter> O<Esc>

"" Restore last cursor position
function! Restore_cursor()
  if line("'\"") > 0 && line("'\"") <= line("$")
    exe "normal! g'\""
  endif
endfunction
autocmd BufReadPost * call Restore_cursor()

"" Navigate code using exuberant ctags
set tags=tags;$HOME
set tags+=$HOME/.vim/tags/cpp
set tags+=$HOME/.vim/tags/curl
set tags+=$HOME/.vim/tags/httpd
set tags+=$HOME/.vim/tags/libmozjs
set tags+=$HOME/.vim/tags/libxml2




