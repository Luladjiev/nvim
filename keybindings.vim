let mapleader = "\<Space>"
let maplocalleader = "\\"

inoremap fd <Esc>

inoremap <C-BS> <C-W>

nnoremap <silent> <C-n> :NERDTreeToggle<CR>

nnoremap <silent> [q :cprev<CR>
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [Q :cfirst<CR>
nnoremap <silent> ]Q :clast<CR>

nnoremap <silent> <leader>att :term<CR>

if executable("bash")
  nnoremap <silent> <leader>atb :e term://bash<CR>
endif

if executable("zsh")
  nnoremap <silent> <leader>atz :e term://zsh<CR>
endif

if executable("powershell")
  nnoremap <silent> <leader>atp :e term://powershell<CR>
endif

nnoremap <silent> <leader>sc :noh<CR>:echo<CR>

" File shortcuts
nnoremap <silent> <leader>fdd :e $MYVIMRC<CR>
nnoremap <silent> <leader>fds :so $MYVIMRC<CR>
nnoremap <silent> <leader>ft :e #<CR>

" Plug shortcuts
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
imap <C-Space> <Plug>(cm_force_refresh)

" Window movement shortcuts
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <silent> ]r :lnext<CR>
nnoremap <silent> [r :lprev<CR>

" Tab shortcuts
nnoremap <silent> <leader>tt :tabnew<CR>
nnoremap <silent> <leader>tn :tabnext<CR>
nnoremap <silent> <leader>tp :tabprev<CR>
nnoremap <silent> <leader>tc :tabclose<CR>
nnoremap <silent> <leader>tm :tabmove

" Buffer shortcuts
nnoremap <silent> <leader><Tab> :bnext<CR>
nnoremap <silent> <leader><S-Tab> :bprevious<CR>
nnoremap <silent> zX :bd!<CR>
nnoremap <silent> zx :bd<CR>
nnoremap <silent> <leader>bs :Startify<CR>
nnoremap <silent> <leader>bk :bufdo bd<CR>

" Fugitive shortcuts
nnoremap <silent> <leader>gf :Gpull -pr<CR>
nnoremap <silent> <leader>gF :Gfetch -p<CR>
nnoremap <silent> <leader>gp :Gpush<CR>
nnoremap <silent> <leader>gP :call leet#GitPush()<CR>
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gB :Gblame<CR>
nnoremap <silent> <leader>go :Gbrowse<CR>
vnoremap <silent> <leader>go :Gbrowse<CR>

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
nnoremap <silent> <leader>sl :BLines<CR>
nnoremap <silent> <leader>sL :Lines<CR>
nnoremap <silent> <leader>ss :Rg <C-R><C-W><CR>
nnoremap <silent> <leader>sS :Rg<CR>

" Undo Tree shortcuts
nnoremap <silent> <leader>u :UndotreeToggle<CR>

" Miscellaneous shortcuts
nnoremap <silent> <leader>jp :%!python -m json.tool<CR>

" Vim Easymotion
nmap <silent> <leader><leader> <Plug>(easymotion-overwin-f)

" Which-key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
