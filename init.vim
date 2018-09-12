runtime plugins.vim
runtime keybindings.vim
runtime commands.vim
runtime lightline.vim

" System
set clipboard+=unnamedplus
set updatetime=100
set grepprg=rg\ --vimgrep
let g:netrw_dirhistmax = 0

" Python configuration
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
"set foldmethod=syntax " disabled because of slowing down large javascript files
set foldlevel=99

" Look 'n Feel
if !exists('g:syntax_on')
  syntax enable
endif
if exists('$TMUX')
  " Colors in tmux
  let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"
endif
set termguicolors
set background=dark
colorscheme dracula

set number
set numberwidth=5
set showmatch
set noshowmode
set cursorline
set list
set listchars=tab:\|\ ,trail:.

" Git gutter
let g:gitgutter_sign_added = '|'
let g:gitgutter_sign_modified = '|'
let g:gitgutter_sign_removed = '|'
let g:gitgutter_sign_removed_first_line = '|'
let g:gitgutter_sign_modified_removed = '|'

" Easymotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0

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

let g:neomake_logfile = '/tmp/neomake.log'

call neomake#configure#automake('w')

" Nvim-Completion-Manager
let g:cm_auto_popup = 1

" Which-key
set timeoutlen=500
