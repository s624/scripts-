
" don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
"filetype off

" TODO: Load plugins here (pathogen or vundle)

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
let mapleader = ","

" Security
"set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
"set visualbell

" Encoding
set encoding=utf-8

" Whitespace
"set wrap
"set textwidth=79
"set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
"set softtabstop=2
"set expandtab
"set noshiftround

" Cursor motion
"set scrolloff=3
"set backspace=indent,eol,start
"set matchpairs+=<:> " use % to jump between pairs
" runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk
"
" Allow hidden buffers
set hidden
"
" Rendering
"set ttyfast
"
" Status bar
"set laststatus=2

" Last line
"set showmode
"set showcmd

" Searching
"nnoremap / /\v
"vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
"map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
"map <leader>q gqip

" Visualize tabs and newlines
"set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
"map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" put
" https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
"colorscheme solarized
colorscheme desert
"colorscheme torte
"colorscheme darkblue
"colorscheme ron
"colorscheme delek

highlight Search ctermbg=Yellow
highlight Search ctermfg=Black

hi SignColumn guibg=#002b36
hi SignColumn ctermfg=none
hi SignColumn ctermbg=none
hi SignatureMarkText ctermbg=none





""""  addtion for latex  """""

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
"filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
"set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
"set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype plugin indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
"let g:tex_flavor='latex'

set list lcs=tab:\|\ 
"this puts a vertical line for indentation with tabs

set foldmethod=indent "you can also set it as syntax. IDK whats the difference
set foldcolumn=0 "you put a number here to leave some column for the +/- signs of fold. 0 for leaving none.
" A few fold commands are zo zc za zr zR zO zC  ...
" z{movements} .. etc
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
"this is to automatically save and load folds


set cursorline
set cursorcolumn
highlight CursorColumn   ctermbg=None ctermfg=None
highlight CursorLine   cterm=None  ctermbg=0 ctermfg=None gui=None
"this highlights current line and column with background color 0 which stands
"for ash and foreground color none
"without the cterm=None the current line gets also underlined



" use these command to install Plug a pluggin manager for vim
" mkdir ~/.vim/autoload
" mkdir ~/.vim/plugged
" cd ~/.vim/autoload
" wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
" Any valid git URL is allowed for plugin
Plug 'https://github.com/valloric/youcompleteme'
" this pugin need to be compiled, to compile the pluggin go to ~/.vim/plugged/youcompleteme;
"then run the program install.py; that pyhothon program depends on another program cmake which need to be installed first with command wudo apt-get install cmake;
" Plug 'valid git URL'
" Shorthand notation for plugin
" plug valloric/youcompleteme
" Plug 'foo/bar'
" Plug 'https://github.com/pseewald/vim-anyfold' "this pluggin autofolds fileviews with matching indentation. go to https://github.com/pseewald/anyfold or type :h anyfold for more info
"Plug 'https://github.com/jacquesbh/vim-showmarks' "this shows an error
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/kshenoy/vim-signature'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/altercation/vim-colors-solarized'
" Initialize plugin system
call plug#end()


set runtimepath^=~/.vim/bundle/ShowMarks/plugin/showmarks.vim








" use the WipeReg command to wipe the registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor













