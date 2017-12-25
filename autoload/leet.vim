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

  return branch == '' ? '' : branch
endfunction

function leet#LightlineLinterErrors()
  let l:counts = neomake#statusline#LoclistCounts()

  let l:errors = get(l:counts, 'E', 0)

  return l:errors == 0 ? '' : printf('E:%d', l:errors)
endfunction

function leet#LightlineLinterWarnings()
  let l:counts = neomake#statusline#LoclistCounts()

  let l:errors = get(l:counts, 'E', 0)
  let l:warnings = get(l:counts, 'W', 0)

  return l:errors != 0 || l:warnings == 0 ? '' : printf('W:%d', l:warnings)
endfunction

function leet#LightlineLinterOk()
  let l:counts = neomake#statusline#LoclistCounts()

  let l:errors = get(l:counts, 'E', 0)
  let l:warnings = get(l:counts, 'W', 0)

  return l:errors == 0 && l:warnings == 0 ? 'OK' : ''
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

