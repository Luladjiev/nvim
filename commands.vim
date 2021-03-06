" Save the current file as sudo
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Use ripgrep with fzf
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --fixed-strings --ignore-case --follow --glob "!.git/*|!node_modules/*" --color=always '
  \   .shellescape(<q-args>).'| tr -d "\017"', 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
