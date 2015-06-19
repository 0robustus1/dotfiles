" Show syntax highlighting groups for word under cursor
" Useful when editing colorschemes.
nmap <leader><leader>p :call <SID>SynStack()<CR>

function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Retrieves the 'current' section inside of a LaTeX document
function! GetSection()
  let hits = []
  execute 'normal! mo'
  let success=search("\\w\*section", "b")
  if success > 0
    execute 'normal! ^'
    s/\V{\(\.\+\)}/\=len(add(hits, submatch(1))) ? submatch(0) : ''/
    " let reg = empty(a:reg) ? '+' : a:reg
    let section = hits[0]
    " execute 'let @'.reg.' = join(hits, "\n") . "\n"'
  endif
  execute 'normal! `o'
  return section
endfunction
command! -register GetSection call GetSection()

" Retrieves all headlines inside of a markdown document
function! DetermineTops()
  let tops = []
  execute 'normal! mo'
  execute 'normal! gg'
  let match_s=search("^\\s\*##\\s")
  while match_s > 0
    execute 'normal! ^'
    s/## \(.\+\)/\=len(add(tops, submatch(1))) ? submatch(0) : ''/
    execute 'normal! j'
    let match_s=search("\\s\*## ")
  endwhile
endfunction
command! -register DetermineTops call DetermineTops()

function! ToggleCursorLine()
  if &cursorline
    set nocursorline
  else
    set cursorline
  end
endfunction

function! ToggleCursorColumn()
  if &cursorcolumn
    set nocursorcolumn
  else
    set cursorcolumn
  end
endfunction
