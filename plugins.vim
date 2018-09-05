call plug#begin('~/.local/share/nvim/plugged')

Plug 'roxma/nvim-completion-manager'
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
