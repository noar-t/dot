" Noah's Vim config
set nocompatible

" visual autocomplete for command menu
set wildmenu

" Mouse support
set mouse=a

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab

" bindings
" Type jk for escape
inoremap jk <esc>
let mapleader='\'


set backspace=indent,eol,start

" alignment plugin but not that advanced yet
"Plug 'junegunn/vim-easy-align'


" Set the runtime path to include fzf
set rtp+=~/.fzf

runtime ftplugin/man.vim

" --------
" Plugins
" --------

" download vim-plug if missing
if empty(glob("~/.vim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif
  
silent! if plug#begin()
  
  " --- Airline (status bar) ---
  Plug 'vim-airline/vim-airline'
  
  " themes for Airline
  " Plug 'vim-airline/vim-airline-themes'
  
  " fixes font
  let g:airline_powerline_fonts = 1
  " enumerate buffers along top
  let g:airline#extensions#tabline#enabled = 1
  " show just the filename
  let g:airline#extensions#tabline#fnamemod = ':t'
  " Always show airline bar
  set laststatus=2 
  " Dont show mode, ariline already does
  set noshowmode
  
  " --- Nerd Tree (file explorer) ---
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  
  " bind ctrl+n to open nerd tree
  map <C-n> :NERDTreeToggle<CR>
  
  " displays changes since last comm
  Plug 'airblade/vim-gitgutter'
  
  " Can use ^{h,j,k,l} to navigate between tmux and vim spits
  Plug 'christoomey/vim-tmux-navigator'
  
  " --- Buffer hotkeys ---
  Plug 'jeetsukumaran/vim-buffergator'
  
  " --- Async syntax linting (linter) ---
  Plug 'w0rp/ale'
  
  " --- Gruvbox (theme) ---
  Plug 'morhetz/gruvbox'
  
  " --- Displays tags ---
  Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
  nmap <F8> :TagbarToggle<CR>
  
  " TESTING NEW STUFF
  
  " --- Fuzzy file finder ---
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  map <C-p> :Files<CR>
  
  " --- Remove distractions ---
  Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
  
  " --- Allow renaming files ---
  Plug 'danro/rename.vim', { 'on': 'Rename' }
  
  " --- Indentation Guide ---
  Plug 'nathanaelkane/vim-indent-guides'
  
  " --- Extra Syntax Highlighting ---
  Plug 'sheerun/vim-polyglot'
  
  Plug 'easymotion/vim-easymotion'
  
  " --- Bracket Matching --- 
  Plug 'jiangmiao/auto-pairs'
  
  " --- Easier Commenting ---
  Plug 'scrooloose/nerdcommenter'
  
  " --- Advanced Git features ---
  Plug 'tpope/vim-fugitive'

  call plug#end()
endif

" highlight over 80chars
highlight Error ctermbg=red ctermfg=white guibg=#592929
match Error /\%81v.\+/


" Initialize plugin system



" set theme
silent! colorscheme gruvbox
set background=dark
let &t_ut=''

" --- Appearance ---
set ruler
set cursorline
set number
syntax enable

" --- Search Options ---
set hlsearch
set ignorecase
set smartcase
set incsearch
