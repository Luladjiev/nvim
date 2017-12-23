function leet#LightlineFilepath()
  let l:path = expand('%')

  if strlen(l:path) < 40
    return l:path
  endif

  let l:short_path = ""
  let l:split_path = split(l:path, "/")
  let l:i = 1

  for p in l:split_path
    if l:i == len(l:split_path)
      let l:short_path = l:short_path . '/' . p
    elseif strpart(p, 0, 1) == '.'
      let l:short_path = l:short_path . '/' . strpart(p, 0, 2)
    else
      let l:short_path = l:short_path . '/' . strpart(p, 0, 1)
    endif
    let l:i += 1
  endfor

  return l:short_path
endfunction

function leet#LightlineBranch()
  let l:branch = fugitive#head(6)

  return branch == '' ? '' : printf(" %s", branch)
endfunction

function leet#LightlineLinterErrors()
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error

  return l:all_errors == 0 ? '' : printf('✗ %d', l:all_errors)
endfunction

function leet#LightlineLinterWarnings()
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:all_non_errors == 0 ? '' : printf('! %d', l:all_non_errors)
endfunction

function leet#LightlineLinterOk()
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✓' : ''
endfunction

function leet#GitPush()
  let l:branch = fugitive#head()

  if l:branch != ''
    execute 'Gpush -u origin' l:branch
  endif

  execute 'Gpush'
endfunction

function leet#GitCheckout(branch)
  let l:branch = split(split(a:branch, " ")[0], "/")[-1]

  if l:branch != ""
    execute 'Git checkout' l:branch
  endif
endfunction

