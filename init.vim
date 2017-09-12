call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Look 'n Feel
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug '~/.local/share/nvim/plugged/onedark.vim/autoload/lightline/colorscheme'

" Version Control
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'airblade/vim-gitgutter'

" File management
Plug 'junegunn/fzf', { 'dir': '~/.local/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'airblade/vim-rooter'

" Code
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'

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
autocmd FileType html,css,js runtime! macros/matchit.vim

" Trigger autoread when changing buffers or coming back to vim.
if has("unix")
  autocmd FocusGained,BufEnter * :silent! !
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
set numberwidth=5
set showmatch
set noshowmode
set cursorline

" Lightline
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'mode_map': {
      \   'n' : 'N',
      \   'i' : 'I',
      \   'R' : 'R',
      \   'v' : 'V',
      \   'V' : 'V-L',
      \   "\<C-v>": 'V-B',
      \   'c' : 'C',
      \   's' : 'S',
      \   'S' : 'S-L',
      \   "\<C-s>": 'S-B',
      \   't': 'T',
      \ },
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['readonly', 'filename', 'git', 'modified'] ],
      \   'right': [ ['linterok', 'linterwarnings', 'lintererrors'],
      \              ['percent', 'lineinfo'],
      \              ['fileformat', 'fileencoding', 'filetype']]
      \ },
      \ 'component_expand': {
      \   'lintererrors': 'LightlineLinterErrors',
      \   'linterwarnings': 'LightlineLinterWarnings',
      \   'linterok': 'LightlineLinterOk'
      \ },
      \ 'component_type': {
      \   'lintererrors': 'error',
      \   'linterwarnings': 'warning'
      \ },
      \ 'component_function': {
      \   'git': 'LightlineBranch',
      \ },
      \}

" Save the current file as sudo
cmap w!! w !sudo tee > /dev/null %

" Keybindings
let mapleader = "\<Space>"

inoremap fd <Esc>

map <silent> <C-n> :NERDTreeToggle<CR>

nnoremap <silent> [q :cprev<CR>
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [Q :cfirst<CR>
nnoremap <silent> ]Q :clast<CR>

nnoremap <silent> <leader>t :term<CR>

nnoremap <silent> <leader>sc :noh<CR>

" Customizing Vim shortcuts
nnoremap <silent> <leader>fd :e $MYVIMRC<CR>
nnoremap <silent> <leader>fs :so $MYVIMRC<CR>
nnoremap <silent> <leader>pi :PlugInstall<CR>
nnoremap <silent> <leader>pc :PlugClean<CR>
nnoremap <silent> <leader>pu :PlugUpdate<CR>
nnoremap <silent> <leader>pU :PlugUpgrade<CR>
nnoremap <silent> <leader>ps :PlugStatus<CR>

" Code shortcuts
noremap <TAB> %

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
nnoremap <silent> ]r :ALENextWrap<CR>
nnoremap <silent> [r :ALEPreviousWrap<CR>

" Buffer shortcuts
nnoremap <silent> <leader><Tab> :bnext<CR>
nnoremap <silent> <leader><S-Tab> :bprevious<CR>
nnoremap <silent> <leader>bD :bd!<CR>
nnoremap <silent> zx :bd<CR>

" Fugitive shortcuts
nnoremap <silent> <leader>gf :Gpull -pr<CR>
nnoremap <silent> <leader>gF :Gfetch -p<CR>
nnoremap <silent> <leader>gp :Gpush<CR>
nnoremap <silent> <leader>gP :call FugitivePush()<CR>
nnoremap <silent> <leader>gS :Gstatus<CR>
nnoremap <silent> <leader>gb :Gblame<CR>

" Magit shortcuts
nnoremap <silent> <leader>gs :call magit#show_magit("c")<CR>

" FZF shortcuts
nnoremap <silent> <leader>, :GFiles<CR>
nnoremap <silent> <leader>. :Files<CR>
nnoremap <silent> <leader>? :GFiles?<CR>
nnoremap <silent> <leader>bb :Buffers<CR>
nnoremap <silent> <leader>fr :History<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>gL :BCommits<CR>
nnoremap <silent> <leader>: :Commands<CR>
nnoremap <silent> <leader>ss :BLines<CR>
nnoremap <silent> <leader>sS :Lines<CR>
nnoremap <silent> <leader>sa :Ag <C-R><C-W><CR>
nnoremap <silent> <leader>sA :Ag <CR>

" Miscellaneous shortcuts
nnoremap <silent> <leader>jp :%!python -m json.tool<CR>

" Deoplete
call deoplete#enable()

" ALE
let g:ale_sign_error = '--'
let g:ale_sign_warning = '--'

let g:ale_linters = {
      \ 'javascript': ['eslint']
      \ }

" Git gutter
let g:gitgutter_sign_added = '|'
let g:gitgutter_sign_modified = '|'
let g:gitgutter_sign_removed = '|'
let g:gitgutter_sign_removed_first_line = '|'
let g:gitgutter_sign_modified_removed = '|'

" Easymotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0

nmap <S-Space> <Plug>(easymotion-overwin-f)

" Vim Rooter
let g:rooter_silent_chdir = 1
let g:rooter_resolve_links = 1

" Custom functions
function! FugitivePush() abort
  let l:branch = fugitive#head()

  if l:branch != ''
    execute "Gpush -u origin " . l:branch
  endif

  execute "Gpush"
endfunction

function! LightlineBranch() abort
  let l:branch = fugitive#head(6)

  return branch == '' ? '' : ("\ue0a0" . printf(" %s", branch))
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error

  return l:all_errors == 0 ? '' : printf('✗ %d', l:all_errors)
endfunction

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:all_non_errors == 0 ? '' : printf('! %d', l:all_non_errors)
endfunction

function! LightlineLinterOk() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✓' : ''
endfunction

augroup LightlineUpdateLinter
  autocmd!
  autocmd User ALELint call lightline#update()
augroup END

" Plugins to keep in mind:
" osyo-manga/vim-anzu
