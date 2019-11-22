runtime! debian.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-repeat'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'manasthakur/vim-commentor'
Plugin 'mhinz/vim-startify'
Plugin 'jiangmiao/auto-pairs'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
Plugin 'airblade/vim-gitgutter'
"Plugin 'junegunn/fzf.vim'
call vundle#end()            " required

filetype plugin indent on    " required
"set compatible

if has("syntax")
  syntax on
endif


" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

set showmatch		" Show matching brackets.
"set autowrite		" Automatically save before commands like :next and :make

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Custom Commands
set tabstop=4
set shiftwidth=4
set relativenumber
set nu rnu
nmap <Up> <NOP>
nmap <Down> <NOP>
nmap <Left> <NOP>
nmap <Right> <NOP>
nmap Q <NOP>
map <silent> <C-o> :NERDTreeToggle<CR>
map <silent> <C-i> :NERDTreeToggle %<CR>
nmap <C-b> :Gstatus<CR>
nmap <C-n> :Gcommit<CR>
nmap <C-m> :!git push<CR>
nmap oo o<Esc>k
nmap OO O<Esc>j
nmap J <C-e>
nmap K <C-y>


" Split navigation
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Settings, plugins
"
"" NERDTree
" enable line numbers
 let NERDTreeShowLineNumbers=1
 " make sure relative line numbers are used
 autocmd FileType nerdtree setlocal relativenumber
 "
"" Airline
let g:airline_theme='hybridline'
let g:airline_solarized_bg='dark'
let g:session_autosave = 'no'
