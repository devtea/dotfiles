syntax enable
set background=dark
colorscheme solarized
set scrolloff=10

"settings for python
syntax on
filetype indent plugin on
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

"Lets just make these universal
set tabstop=8
set expandtab
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

