set nocompatible
set autochdir
filetype off
syntax on
filetype plugin indent on
set modelines=0
set number
set ruler
set visualbell 
set t_vb=

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

set autoindent

" Plugins {{{

call plug#begin('~/.vim/plugged')

  Plug 'jremmen/vim-ripgrep'
  Plug 'airblade/vim-gitgutter'
  Plug 'altercation/vim-colors-solarized'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'dag/vim-fish'
  Plug 'easymotion/vim-easymotion'
  Plug 'flazz/vim-colorschemes'
  Plug 'mbbill/undotree'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'vim-syntastic/syntastic'
  Plug 'Konfekt/FastFold'
  Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp', 'proto']}
  Plug 'vim-scripts/doxygentoolkit.vim',      { 'for': 'cpp' }
  Plug 'octol/vim-cpp-enhanced-highlight',    { 'for': 'cpp' }
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'fatih/vim-go'
  Plug 'elzr/vim-json', { 'for': 'json' }
  Plug 'cespare/vim-toml', { 'for': 'toml' }
  Plug 'w0ng/vim-hybrid'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'terryma/vim-multiple-cursors'
  Plug 'junegunn/vim-easy-align'
  Plug 'chrisbra/NrrwRgn'
  Plug 'https://github.com/wesQ3/vim-windowswap'
  Plug 'w0rp/ale'
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf.vim'
  Plug 'roxma/nvim-yarp'
  Plug 'tpope/vim-fugitive'
  Plug 'christoomey/vim-conflicted'
  Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}


call plug#end()

"  }}}
"
"
set stl+=%{ConflictedVersion()}

" Colours {{{

syntax enable
set background=dark
colorscheme gruvbox
set laststatus=2

let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['gitbranch','readonly', 'filename', 'modified'], ],
  \         'right': [['lineinfo'], ['percent'], ['filetype'], ['fileformat', 'fileencoding']]
  \     },
  \     'component_function': {
  \         'gitbranch': 'fugitive#head'
  \   },
  \ }

let g:solarized_termtrans = 1
let g:solarized_termcolors = 16
let g:solarized_contrast = "normal"
let g:solarized_visibility = "normal"
set t_Co=256
hi Normal guibg=NONE ctermbg=NONE
" }}}



" Mappings {{{

xnoremap <leader>p :w !python<cr>

noremap <leader>a =ip

nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>
map <C-o> :NERDTreeToggle<CR>
noremap cp yap<S-}>p
map ; :Files<CR>

" }}}
"

" Undo/Backup/Swap {{{
  if !isdirectory(expand("~/.vim/undo/"))
    silent !mkdir -p ~/.vim/undo
  endif

  set undodir^=~/.vim/undo/                  
  set undofile
  set nobackup                               
  set nowritebackup                         
  set noswapfile                           
" }}}


" Auto-complete {{{
  set wildmenu                                     " Command-line completion
  set wildmode=list:full
  set wildignore+=.hg,.git,.svn                    " Version control
  set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
  set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " Binary images
  set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " Compiled object files
  set wildignore+=*.spl                            " Compiled spelling lists
  set wildignore+=*.sw?                            " Vim swap files
  set wildignore+=*.DS_Store                       " OSX bullshit
  set wildignore+=*.orig                           " Merge resolution files
" }}}


" Misc {{{
  set tabstop=4
  set shiftwidth=4
  set expandtab

"}}}

" NERDTree {{{

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
let NERDTreeShowHidden=1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"}}}
