call plug#begin('~/.local/share/nvim/plugged')

Plug 'roxma/nvim-completion-manager'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

" Look 'n Feel
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug '~/.local/share/nvim/plugged/onedark.vim/autoload/lightline/colorscheme'
Plug 'mhinz/vim-startify'
Plug 'henrik/vim-indexed-search'

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
Plug 'neomake/neomake'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'

" Javascript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'js'] }

" Typescript
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript', 'ts'] }
Plug 'mhartington/nvim-typescript', { 'for': ['typescript', 'ts'] }

call plug#end()
