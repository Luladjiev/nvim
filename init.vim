call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Look 'n Feel
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug '~/.local/share/nvim/plugged/onedark.vim/autoload/lightline/colorscheme'

" Version Control
Plug 'tpope/vim-fugitive'

call plug#end()

call deoplete#enable()

" System
set clipboard+=unnamedplus
let g:python_host_prog = 'C:\Applications\Python27\python.exe'
let g:python3_host_prog = 'C:\Applications\Python3\python.exe'

" Search
set ignorecase
set smartcase

" Typing
set expandtab
set tabstop=2
set shiftwidth=2

" Look 'n Feel
set number
set showmatch
set noshowmode
set cursorline

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \}

syntax on
colorscheme onedark

" Keybindings
inoremap fd <Esc>
