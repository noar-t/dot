" Noah's Vim config
set nocompatible

" visual autocomplete for command menu
set wildmenu
set wildmode=full

"TODO maybe add spell checking

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

" ------ Plugins to eventually learn ------
"Plug 'junegunn/vim-easy-align'
"Plug 'tpope/vim-fugitive'
"Plug 'terryma/vim-multiple-cursors'


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
  let g:airline_powerline_fonts = 1                " Fixes font
  let g:airline#extensions#tabline#enabled = 1     " Enumerate buffers along top
  let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
  set laststatus=2                                 " Always show airline bar
  set noshowmode                                   " Dont show mode, ariline already does
  
  " --- Nerd Tree (file explorer) ---
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  map <C-n> :NERDTreeToggle<CR>|                   " Bind ctrl+n to open nerd tree
  
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

  " --- Fuzzy file finder ---
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  map <C-p> :Files<CR>|                           " Ctrl+p will fuzzy find files
  
  " --- Remove distractions ---
  Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
  let g:goyo_width = 100 " Set width for Goyo mode

  " --- Allow renaming files ---
  Plug 'danro/rename.vim', { 'on': 'Rename' }

  " --- Extra Syntax Highlighting ---
  Plug 'sheerun/vim-polyglot'

  " New Stuff to Learn
  
  " --- Indentation Guide ---
  Plug 'Yggdroot/indentLine'

  " -- Move quickly around  
  Plug 'easymotion/vim-easymotion'
  
  " --- Easier Commenting ---
  Plug 'scrooloose/nerdcommenter'
  let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
  
  call plug#end()
endif

" highlight over 80chars
highlight Error ctermbg=red ctermfg=white guibg=#592929
match Error /\%81v.\+/

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
