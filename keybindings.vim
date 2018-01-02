let mapleader = "\<Space>"
let maplocalleader = "\\"

inoremap fd <Esc>

inoremap <C-BS> <C-W>

nnoremap <silent> <C-n> :NERDTreeToggle<CR>

nnoremap <silent> [q :cprev<CR>
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [Q :cfirst<CR>
nnoremap <silent> ]Q :clast<CR>

nnoremap <silent> <leader>tt :term<CR>

if executable("bash")
  nnoremap <silent> <leader>tb :e term://bash<CR>
endif

if executable("zsh")
  nnoremap <silent> <leader>tz :e term://zsh<CR>
endif

if executable("powershell")
  nnoremap <silent> <leader>tp :e term://powershell<CR>
endif

nnoremap <silent> <leader>sc :noh<CR>:echo<CR>

" Customizing Vim shortcuts
nnoremap <silent> <leader>fd :e $MYVIMRC<CR>
nnoremap <silent> <leader>fs :so $MYVIMRC<CR>
nnoremap <silent> <leader>pi :PlugInstall<CR>
nnoremap <silent> <leader>pc :PlugClean<CR>
nnoremap <silent> <leader>pu :PlugUpdate<CR>
nnoremap <silent> <leader>pU :PlugUpgrade<CR>
nnoremap <silent> <leader>ps :PlugStatus<CR>

" Code shortcuts
map <TAB> %

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

nnoremap <silent> ]r :lnext<CR>
nnoremap <silent> [r :lprev<CR>

" Buffer shortcuts
nnoremap <silent> <leader><Tab> :bnext<CR>
nnoremap <silent> <leader><S-Tab> :bprevious<CR>
nnoremap <silent> zX :bd!<CR>
nnoremap <silent> zx :bd<CR>

" Fugitive shortcuts
nnoremap <silent> <leader>gf :Gpull -pr<CR>
nnoremap <silent> <leader>gF :Gfetch -p<CR>
nnoremap <silent> <leader>gp :Gpush<CR>
nnoremap <silent> <leader>gP :call leet#GitPush()<CR>
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gB :Gblame<CR>
nnoremap <silent> <leader>go :Gbrowse<CR>

" GitGutter shortcuts
nnoremap <silent> <leader>ghs :GitGutterStageHunk<CR>
nnoremap <silent> <leader>ghu :GitGutterUndoHunk<CR>
nnoremap <silent> <leader>ghd :GitGutterPreviewHunk<CR>

if has('win32')
  nnoremap <silent> <leader>gb :call fzf#run({
        \ 'source': 'git branch -av \| findstr /V /C:"*" /C:"HEAD" /C:"/master"',
        \ 'sink': function('leet#GitCheckout')
        \ })<CR>
else
  nnoremap <silent> <leader>gb :call fzf#run({
        \ 'source': 'git branch -av \| grep -v "*\\\|HEAD\\\|/master"',
        \ 'sink': function('leet#GitCheckout')
        \ })<CR>
endif

" Magit shortcuts
nnoremap <silent> <leader>gS :call magit#show_magit("c")<CR>

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

" Undo Tree shortcuts
nnoremap <silent> <leader>u :UndotreeToggle<CR>

" Miscellaneous shortcuts
nnoremap <silent> <leader>jp :%!python -m json.tool<CR>
