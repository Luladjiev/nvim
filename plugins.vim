call plug#begin('~/.local/share/nvim/plugged')

" Autocompletion
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

if has('unix')
  Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }
elseif has('win32')
  Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'powershell -executionpolicy bypass -File install.ps1',
        \ }
endif

Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

" Look 'n Feel
Plug 'itchyny/lightline.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'mhinz/vim-startify'
Plug 'henrik/vim-indexed-search'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

" Version Control
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'jreybert/vimagit'
Plug 'airblade/vim-gitgutter'

" File management
Plug 'junegunn/fzf', { 'dir': '~/.local/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'airblade/vim-rooter'

" Code
Plug 'sheerun/vim-polyglot'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'

call plug#end()
