call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Look 'n Feel
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug '~/.local/share/nvim/plugged/onedark.vim/autoload/lightline/colorscheme'

" Version Control
Plug 'tpope/vim-fugitive'

" File management
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'

" Code
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'

call plug#end()

" System
set clipboard+=unnamedplus
let g:loaded_python_provider = 1
let g:python3_host_prog = 'C:\Applications\Python3\python.exe'

filetype plugin on

" Search
set ignorecase
set smartcase

" Typing
set expandtab
set tabstop=2
set shiftwidth=2

" Look 'n Feel
syntax on
colorscheme onedark

set number
set showmatch
set noshowmode
set cursorline

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['readonly', 'filename', 'git', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'git': 'fugitive#head'
      \ }
      \}

" Keybindings
inoremap fd <Esc>

map <C-n> :NERDTreeToggle<CR>

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><C-g> deoplete#undo_completion()
inoremap <expr><C-Space>  pumvisible() ? "" : deoplete#manual_complete()

" Deoplete
call deoplete#enable()

" ALE
let g:ale_linters = {
      \ 'javascript': ['eslint']
      \ }

" Ack
let g:ackprg = 'ag --nogroup --nocolor --column'
