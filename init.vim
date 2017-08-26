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
      \             ['readonly', 'filename', 'git', 'modified'] ],
      \   'right': [ ['linterok', 'linterwarnings', 'lintererrors'],
      \              ['percent', 'lineinfo'],
      \              ['fileformat', 'fileencoding', 'filetype']]
      \ },
      \ 'component_expand': {
      \   'lintererrors': 'LinterStatusErrors',
      \   'linterwarnings': 'LinterStatusWarnings',
      \   'linterok': 'LinterStatusOk'
      \ },
      \ 'component_type': {
      \   'lintererrors': 'error',
      \   'linterwarnings': 'warning'
      \ },
      \ 'component_function': {
      \   'git': 'fugitive#head',
      \ },
      \}


function! LinterStatusErrors() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error

    return l:all_errors == 0 ? '' : printf('%d', l:all_errors)
  endfunction
function! LinterStatusWarnings() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:all_non_errors == 0 ? '' : printf('%d', l:all_non_errors)
endfunction
function! LinterStatusOk() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : ''
  endfunction
augroup UpdateStatuslineLinter
    autocmd!
    autocmd User ALELint call lightline#update()
augroup END

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

" CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|node_modules\|test\|reports\|compiled\|log\|tmp$'
  \ }
