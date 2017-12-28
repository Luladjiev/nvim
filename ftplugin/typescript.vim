au BufWinEnter *.ts :let b:neomake_typescript_tslint_exe = leet#GetNpmBin('tslint')

map <buffer> <silent> <localleader>d :TSDoc<CR>
map <buffer> <silent> <localleader>gd :TSDef<CR>
map <buffer> <silent> <localleader>gp :TSDefPreview<CR>
map <buffer> <silent> <localleader>r :TSRefs<CR>
map <buffer> <silent> <localleader>R :TSRename<CR>
map <buffer> <silent> <localleader>i :TSImport<CR>
