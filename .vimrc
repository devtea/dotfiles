"Required settings for vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Vundle plugins we want
Plugin 'davidhalter/jedi-vim'
Plugin 'klen/python-mode'
Plugin 'simple-pairs'
Plugin 'tpope/vim-fugitive'
Plugin 'saltstack/salt-vim'
Plugin 'tmhedberg/SimpylFold'  " Smarter folding for python
" Plugin 'chriskempson/base16-vim' " Base 16 color

" Python-Mode customizations
"

" Disable rope to be provided by jedi-vim
let g:pymode_rope = 0
"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1
" Support virtualenv
let g:pymode_virtualenv = 1
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" Don't autofold code
let g:pymode_folding = 0
" Skip line length errors and function complexity
let g:pymode_lint_ignore = "E501,C901" 

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



"stuff
"

" Enable 256 colorspace
let base16colorspace=256

syntax enable
set background=dark
set scrolloff=10
colorscheme gruvbox

"settings for python
syntax on
filetype indent plugin on
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

" set make use python - note, this will break other languages
set makeprg=python\ %

"Lets just make these universal
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
filetype indent on

"Set the wildmenu to behave more like bash tab completion
set wildmode=longest:full
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Line number settings
" Setting both makes the cursor line show the absolute number"
set number
set relativenumber

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Highlight search results
set hlsearch

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()




