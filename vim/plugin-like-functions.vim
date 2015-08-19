" plugin-like functions                  #
" - contains more complex function stack #
" ########################################

" German umlauts #
" ################

function! RemoveIMappingIfExists(mapping)
  try
    execute 'iunmap' a:mapping
  catch /E31/
  endtry
endfunction

function! RemoveUmlautsOtherwise(mappings)
  for pair in a:mappings
    execute 'autocmd' 'FileType,BufEnter,BufLeave' '*' 'call' "RemoveIMappingIfExists('". pair[0] ."')"
  endfor
endfunction

function! SetUmlautMappings(filetype)
  for [map_from, map_to]  in g:umlaut_mappings
    call SetUmlautMapping(a:filetype, map_from, map_to)
  endfor
endfunction

function! SetUmlautMapping(filetype, map, mapped)
  let current_filetype = &filetype
  if current_filetype == a:filetype
    execute 'inoremap' a:map a:mapped
  endif
endfunction

command! -nargs=1 SetUmlautMappings call SetUmlautMappings(<f-args>)

function! ImplementUmlauts()
  augroup umlauts
    call RemoveUmlautsOtherwise(g:umlaut_mappings)
    for file_type in g:file_types
      execute 'autocmd' 'FileType' file_type 'SetUmlautMappings' file_type
      execute 'autocmd' 'BufEnter,BufLeave' '*' 'SetUmlautMappings' file_type
    endfor
  augroup end
endfunction

" german umlauts, technically not abbreviations
let g:umlaut_mappings = [ ['"a', 'ä'], ['"o', 'ö'], ['"u', 'ü'], ['"A', 'Ä'], ['"O', 'Ö'], ['"U', 'Ü'] ]
let g:file_types = ['mkd', 'tex', 'text', 'mail', 'gitcommit']

call ImplementUmlauts()

" Complete E-Mail addresses from adress book #
" ############################################
" for Mac OS X, needs contacts binary

" contacts -Sf '%eTOKEN%n' 'stuga' | tail -n 1 | awk -F 'TOKEN' '{print "\"" $2 "\"" " <" $1 ">" }'
function! FindEmailFor(text)
  let result=system(FindEmailCommandFor(a:text))
  let inline=substitute(result, "\.\$", "", "")
  call setline(line('.'), getline(line('.')) . inline)
endfunction

function! FindEmailCommandFor(text)
  let inner_awk_cmd='{print "\"" $2 "\"" " <" $1 ">" }'
  let contacts_cmd="contacts -Sf '%eTOKEN%n' '".a:text."'"
  let tail_cmd="tail -n 1"
  let awk_cmd="awk -F 'TOKEN' '".inner_awk_cmd."'"
  return contacts_cmd." | ".tail_cmd." | ".awk_cmd
endfunction

command! -nargs=+ -register -bar EmailFor call FindEmailFor("<args>")

" Find definitions in ruby files #
" ################################

function! EscapeRE(re)
  let escaped_pipe=substitute(a:re, '|', '\|', 'g')
  let escaped_backslash=substitute(escaped_pipe, '\\', '\\\\', 'g')
  let escaped_pipe_backslash=substitute(escaped_backslash, '\\\\|', '\\\\\\|', 'g')
  echo escaped_pipe_backslash
  return escaped_pipe_backslash
endfunction

function! FindDefinitionFor(text)
  let regex=shellescape("(def self\\.\\\|scope :)" . a:text)
  execute 'silent!' 'grep' regex
  redraw!
endfunction

function! CurrentWord()
  return expand("<cword>")
endfunction

nnoremap <leader>d :call FindDefinitionFor(CurrentWord())<cr>
" <leader>d searches for the definition of the word under the cursor
" nnoremap <leader>d :silent execute "Agg " . shellescape('(def\\\|class\\\|module) ' . expand("<cword>"))<return><esc>w

" nnoremap <leader>d :execute "grep " . shellescape("(def self\\.\\\|scope :)" . expand("<cword>"))<return>

" Mark text inside of parentheses (see emacs) #
" #############################################
" WIP

function! MarkInsideParentheses()
  normal %
  normal mo
  normal %
  normal mi
  normal %
endfunction

hi InsideParentheses term=italic ctermfg=black ctermbg=white
match InsideParentheses /\%>'i\_.*\%<'o/
nnoremap <silent> <leader>i :call MarkInsideParentheses()<cr>

" List files that were changed in this branch #
" #############################################

let g:base_branch = "staging"

function! OpenAndWipeTmpBuffer(buffer_name, ...)
  let win_number = bufwinnr(a:buffer_name)
  let split_command = a:0 > 0 ? a:1 : "split"
  if win_number == -1
    execute split_command . " " .  a:buffer_name
  else
    execute win_number . "wincmd w"
  endif

  normal! ggdG
  setlocal buftype=nofile
endfunction

function! OpenBranchFileListBuffer()
  let range = g:base_branch ."...HEAD"
  let branch_file_list = system("git diff --name-only " . range)

  call OpenAndWipeTmpBuffer("__git_branch_file_list__")

  call append(0, split(branch_file_list, '\v\n'))

  normal! gg
endfunction

nnoremap <silent> <leader>f :call OpenBranchFileListBuffer()<cr>

" Show stat of commit in git
function! OpenCommitStatBuffer(commit_hash)
  let output = system("git show --stat '" . a:commit_hash . "'")

  call OpenAndWipeTmpBuffer("__git_show_stat__", "vsplit")

  call append(0, split(output, '\v\n'))

  normal! gg
  silent normal! :w /dev/null<cr>
endfunction

command! -nargs=1 -bar CommitStat call OpenCommitStatBuffer("<args>")
command! CommitStatHere call OpenCommitStatBuffer(expand("<cword>"))
nnoremap <silent> <leader>s :CommitStatHere<cr>

" Move window to different tab #
" ##############################
" taken from http://vim.wikia.com/wiki/Move_current_window_between_tabs

function MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    sp
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    sp
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

nnoremap <leader>> :call MoveToNextTab()<CR>
nnoremap <leader>< :call MoveToPrevTab()<CR>

