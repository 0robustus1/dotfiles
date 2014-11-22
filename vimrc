" ##################################################
" This .vimrc Configuration File is based on Bram  #
" Moolenaars example-version.                      #
" It has been altered to my needs, by robustus(me).#
" ##################################################

" explicitely set the path to ruby
let g:ruby_path = '/usr/local/var/rbenv/shims/'

" this is the 21. century, use vim not vi goddammit...
set nocompatible

" ################
" vundle Yeah!!! #
" ################

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" #########
" Bundles #
" #########

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-haml'
Plugin 'Indent-Guides'
Plugin 'tpope/vim-markdown'
Plugin 'buftabs'
Plugin 'commentary.vim'
Plugin 'ctrlp.vim'
Plugin 'cucumber.zip'
Plugin 'tpope/vim-fugitive'
Plugin 'rails.vim'
Plugin 'surround.vim'
Plugin 'vim-coffee-script'
Plugin 'vim-task'
Plugin 'xml.vim'
Plugin 'LaTeX-Box'
Plugin 'yaymukund/vim-rabl'
Plugin 'UltiSnips'
Plugin 'a.vim'
Plugin '0robustus1/vim-borderless'
Plugin 'Handlebars'
Plugin 'tpope/vim-endwise'
Plugin 'Tabular'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-vinegar'
Plugin '0robustus1/vim-tmux-conf'
Plugin 'vim-scripts/taglist.vim'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'tpope/vim-fireplace'
Plugin 'HTML-AutoCloseTag'
Plugin 'mamut/vim-css-hex'
Plugin 'vim-scripts/marvim'
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'reedes/vim-colors-pencil'
Plugin 'thoughtbot/vim-rspec'
Plugin 'jgdavey/tslime.vim'
Plugin 'PeterRincker/vim-argumentative'
Plugin 'cespare/vim-toml'
Plugin 'vim-erlang/vim-erlang-runtime'
Plugin 'vim-erlang/vim-erlang-compiler'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'vim-erlang/vim-erlang-tags'
Plugin 'elixir-lang/vim-elixir'

call vundle#end()

syntax on
filetype plugin indent on

" #################
" # View Settings #
" #################

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
"set incsearch		" do incremental searching
"Some settings from Steve Loshs vimrc.
"Needs looking through
set scrolloff=3 " number of lines which are to be above/below the cursor
set showmode " show current mode
"set hidden " some crazy buffer stuff
"set wildmenu " enhanced cmdline completion
"set wildmode=list:longest " cmdline completion like ctrl+n
set visualbell " yeah, well just activates visualbell
set relativenumber " show linenumbers relative to current line
set number " Display absolute line-numbers,
           " interacts with relativenumber, to display absolute number
           " instead of 0 on current line
set ttyfast " special settings for fast ttys (most are)
set laststatus=2 " always displays a status line.
set hlsearch " highlight when searching
"improve autocomplete menu color
" highlight Pmenu ctermbg=238 gui=bold
" nice linebreaks on soft wrap
set formatoptions+=l
set lbr

if has('gui_running')
  " set cmdheight=2
  " to prevent the disappearing cursor when splitting windows. (alternatively
  " run a shell command :! echo > /dev/null)
  " set guioptions-=L
  " set gfn=Menlo\ 15
  " autocmd FileType ruby,eruby color blackboard
  " do not use graphical dialogs, but internal (commandline) ones instead.
  set guioptions+=c
  if has("gui_gtk2")
    set guifont=Consolas\ 14
  elseif has("gui_win32")
    " set guifont=Consolas:h11:cANSI
  elseif has("gui_macvim")
    silent! set guifont=Source\ Code\ Pro\ Medium:h15
    if &guifont != 'Source Code Pro Medium:h15'
      set guifont=Menlo:h15
    endif
  endif
else
endif
color pencil
set background=dark

" #############
" # usability #
" #############

" just use the mouse, if possible...
if has('mouse')
  set mouse=a
endif

" setting the leader to the comma-char
let mapleader=","

" Some people just don't like backup files.
" set nobackup

" Alternative : Just specify own places for backup
"               and swap files.
set backupdir=$HOME/.vim/backups,/tmp
set directory=$HOME/.vim/backups,/tmp

" Underline the current line
set cursorline

" opening vertical splits to the right
set splitright
" opening horizontal splits to the bottom
set splitbelow

" #################################
" # File-Type and Syntax Settings #
" #################################

au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars
au BufRead,BufNewFile *.rake,*.cap set ft=ruby
au BufRead,BufNewFile *.muttrc set ft=muttrc

" To enforce a maximum textwidth of 78
" augroup vimrcEx
"   au!
"   autocmd FileType text setlocal textwidth=78
" augroup END

" ######################
" # Key-Based Settings #
" ######################

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" #####################
" Tab and Indentation #
" #####################

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent

" ##########
" Spelling #
" ##########

set encoding=utf-8
" autocmd FileType tex  setlocal spell spelllang=de
" autocmd FileType markdown   setlocal spell spelllang=de,en


" ################
" Filetype Stuff #
" ################

" Setting filetype correctly
autocmd BufRead,BufNewFile *.sieve set filetype=sieve
autocmd BufRead,BufNewFile *.kd set filetype=markdown
autocmd BufRead,BufNewFile *.thor set filetype=ruby
autocmd BufRead,BufNewFile Guardfile set filetype=ruby
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead *.pde set filetype=arduino
autocmd BufRead,BufNewFile *.ino set filetype=arduino

autocmd FileType rust set softtabstop=2 tabstop=2 shiftwidth=2

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
let g:file_types = ['markdown', 'tex', 'text', 'mail', 'gitcommit']

call ImplementUmlauts()

" ##########
" Mappings #
" ##########

" yankbuffers accessible on int-keyboard
map ± "
inoremap <leader>, <esc><<i
" easy indentation
" nnoremap <leader>, <<
" nnoremap <leader>. >>
" on many keyboards you accidently press F1 instead of ESC,
" now both do the same thing when not in normalmode
inoremap <F1> <ESC>
vnoremap <F1> <ESC>
" move splits around
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" deactivate highlight after search
nnoremap <F9> :noh<return><esc>
nnoremap <leader>w <C-w>v<C-w>l
" For buffer-movement
noremap <F11> :bprev<CR>
noremap <F12> :bnext<CR>
" inserting timestamp
nmap <F10> a<C-R>=strftime("%Y-%m-%d %H:%M:%S%z")<CR><Esc>
imap <F10> <C-R>=strftime("%Y-%m-%d %H:%M:%S%z")<CR>
" Show TagList
nmap <F5> :TlistToggle<CR>
" Use Ex-Mode Mapping (<Shift-Q>) for default macro execution
nnoremap Q @q

" Sometimes it takes to long for
" the leader key to be processed.
" this sets only for mappings, as long as ttimeoutlen is set
set timeoutlen=800
" if the value is positive it sets timeout for key codes.
set ttimeoutlen=50

" ###############
" Abbreviations #
" ###############

" Shift and A are to close...
cnoreabbrev ack Ack

" ###########################
" Plugin-dependent settings #
" ###########################

" LaTeX-Suite #
" #############

" For working german 'umlauts' on
" american layout.
let g:Tex_SmartKeyQuote = 0

let g:tex_flavor='latex'
set grepprg=grep\ -nH\ $*

let g:Tex_Folding=0 " I don't like folding.
set iskeyword+=:

" Ctrl-P #
" ########

function! SafeCtrlP()
  let the_cwd=getcwd()
  let home_d=expand('~')
  if the_cwd == home_d
    echom "You probably don't want to do this at home..."
  else
    execute 'CtrlP'
  endif
endfunction

command! -register SafeCtrlP call SafeCtrlP()
" only works in conjunction with
" mapping settings in gvimrc
" let g:ctrlp_map = '<Ctrl-p>'
" let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_cmd = 'SafeCtrlP'

 " MacOSX/Linux
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jar,*.class,*.dependencies

" #########################
" Stupid Stuff Prevention #
" #########################

" Preventing Lines which are too
" long, by warning me.
" set columns=80
" highlight OverLength ctermbg=red ctermfg=white
" match OverLength /\%81v.\+/
" tmux copying on mac os x
" set clipboard=unnamed

" ######################
" sanity related stuff #
" ######################

" let Y behave like D but for copying,
" instead of copying the whole line (which is what yy does)
nnoremap Y y$
" i don't want to break my finger when jumping between parentheses-matches
nnoremap <leader>. %
" open the alternate file (last file i edited) with ease
nnoremap <leader>a :e #<cr>

" layout stuff #
" ##############

set conceallevel=3
autocmd FileType c set conceallevel=0

set list
set listchars=tab:>·,trail:·
set linebreak

" set foldmethod=syntax
" set foldlevelstart=5

" ##########
" Gimmicks #
" ##########
"
" Show syntax highlighting groups for word under cursor
nmap <leader><leader>p :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

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

" ##################
" Special Mappings #
" ##################


" encode complete file with ROT13
nnoremap ≠ mlggg?G`l
nnoremap <leader>cl :call ToggleCursorLine()<CR>
nnoremap <leader>cc :call ToggleCursorColumn()<CR>
" Creating folds based on %-Matching
map <leader>z ^V%zf
nnoremap <c-w>t :tabnew<cr>

" UltiSnips Settings #
" ####################

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsEditSplit="vertical"

" vim-rspec #
" ###########

map <Leader>rt :call RunCurrentSpecFile()<CR>
map <Leader>rn :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
" Only useful when not using terminal vim
" let g:rspec_runner = "os_x_iterm"

" ag for grep (and use in ctrlp) #
" ################################

" Many thanks to thoughtbot: http://robots.thoughtbot.com/faster-grepping-in-vim/
if executable('ag')
  " Use ag over grep
  " set grepprg=grep -PnH $*
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
  "
  " bind \ (backward slash) to grep shortcut
  command! -nargs=+ -complete=file -bar Ag silent! grep! "<args>"|cwindow|redraw!
  command! -nargs=+ -complete=file -bar Agg silent! grep! <args>|cc1|redraw!
  noreabbrev ag Ag
endif

nnoremap <leader>b :Gblame<return>

" speed-issues
" set synmaxcol=800
" let loaded_matchparen = 1

" git-gutter
let g:gitgutter_enabled = 0
noremap <F12> :GitGutterToggle<CR>

" Allow looking up manpages with :Man
runtime ftplugin/man.vim

" function! MarkInsideParentheses()
"   normal %
"   normal mo
"   normal %
"   normal mi
"   normal %
" endfunction

" hi InsideParentheses term=italic ctermfg=black ctermbg=white
" match InsideParentheses /\%>'i\_.*\%<'o/
" nnoremap <silent> <leader>i :call MarkInsideParentheses()<cr>

let g:base_branch = "staging"

function! OpenAndWipeTmpBuffer(buffer_name)
  let win_number = bufwinnr(a:buffer_name)
  if win_number == -1
    execute "split" . " " .  a:buffer_name
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


" Deactivate 'clearing uses the current background color', with
" background color referring to the background color that was being
" set by the terminal emulator.'
set t_ut=

" Move window to different tab
" ===================================================================
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

" :E: Move window to different tab
" ===================================================================
