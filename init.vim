call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Look 'n Feel
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug '~/.local/share/nvim/plugged/onedark.vim/autoload/lightline/colorscheme'

" Version Control
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" File management
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'

" Code
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'

call plug#end()

" System
set clipboard+=unnamedplus
let g:loaded_python_provider = 1

if has('unix')
  let g:python3_host_prog = '/usr/bin/python3'
elseif has('win32')
  let g:python3_host_prog = 'C:\Applications\Python3\python.exe'
endif

filetype plugin on

autocmd BufWritePre * %s/\s\+$//e " trim whitespace on save

" Trigger autoread when changing buffers or coming back to vim.
if has("unix")
  au FocusGained,BufEnter * :silent! !
endif

" Scrolling
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

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
set relativenumber
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
let mapleader = "\<Space>"

inoremap fd <Esc>

map <C-n> :NERDTreeToggle<CR>

" Autocomplete shortcuts
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><C-g> deoplete#undo_completion()
inoremap <expr><C-Space>  pumvisible() ? "" : deoplete#manual_complete()

" Window movement shortcuts
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" ALE Movement shortcuts
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" Buffer shortcuts
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <leader>bb :ls<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bD :bd!<CR>

" Fugitive shortcuts
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gj :cnext<CR>
nnoremap <leader>gk :cprev<CR>
nnoremap <leader>gh :clast<CR>
nnoremap <leader>gl :cfirst<CR>
nnoremap <leader>gL :Glog -10 -- %<CR>:copen<CR>

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
  \ 'dir': '\.git$\|node_modules\|reports\|compiled\|log\|tmp$'
  \ }

if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
