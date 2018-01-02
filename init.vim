runtime plugins.vim
runtime keybindings.vim
runtime lightline.vim

" System
set clipboard+=unnamedplus
let g:loaded_python_provider = 1

if has('unix')
  let g:python3_host_prog = '/usr/bin/python3'
elseif has('win32')
  let g:python3_host_prog = 'C:\Applications\Python3.5\python.exe'
endif

set noswapfile
set nobackup

set hidden

augroup leet
  autocmd!
augroup leet

autocmd leet BufWritePre * %s/\s\+$//e " trim whitespace on save
autocmd leet FileType html,css,js runtime! macros/matchit.vim " activate matchit
autocmd leet TermOpen * startinsert

" Trigger autoread when changing buffers or coming back to vim.
if has("unix")
  autocmd leet FocusGained,BufEnter * :silent! !
endif

" Persistent Undo
if has("persistent_undo")
    set undodir=~/.local/share/nvim/undodir
    set undofile
endif

" Scrolling
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Search
set ignorecase
set smartcase

set path+=**

" Typing
set expandtab
set tabstop=2
set shiftwidth=2
set foldmethod=syntax
set foldlevel=99

" Look 'n Feel
if !exists('g:syntax_on')
  syntax enable
endif
colorscheme onedark

set number
set numberwidth=5
set showmatch
set noshowmode
set cursorline

" Save the current file as sudo
command WW :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Deoplete
let g:deoplete#file#enable_buffer_path = 1
call deoplete#enable()

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

" FZF
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Neomake
let g:neomake_error_sign = {'text': '●'}
let g:neomake_warning_sign = {'text': '·'}

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_typescript_enabled_makers = ['tslint']

call neomake#configure#automake('w')
