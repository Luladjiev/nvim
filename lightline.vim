let g:lightline = {
      \ 'colorscheme': 'nightowl',
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
      \   'lintererrors': 'leet#LightlineLinterErrors',
      \   'linterwarnings': 'leet#LightlineLinterWarnings',
      \   'linterok': 'leet#LightlineLinterOk'
      \ },
      \ 'component_type': {
      \   'lintererrors': 'error',
      \   'linterwarnings': 'warning'
      \ },
      \ 'component_function': {
      \   'filename': 'leet#LightlineFilepath',
      \   'git': 'leet#LightlineBranch',
      \ },
      \}

augroup LightlineUpdateLinter
  autocmd!
  autocmd User NeomakeFinished call lightline#update()
augroup END
