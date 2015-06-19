" ###########################################################################
" In the past this .vimrc was based on Bram Moolenaars original             #
" example-version. However after a couple of years of changes, alterations, #
" deletions and additions it doesn't resemble this example file anymore. So #
" now this is basically my vimrc, sans the more 'private' settings.         #
"                   robustus AT rightsrestricted DOT com                    #
" ###########################################################################

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

" Unused
" Plugin 'othree/html5.vim'
" Plugin 'wting/rust.vim'
" Plugin 'faith/vim-go'
" Plugin 'kana/vim-fakeclip'
" Plugin 'jacquesbh/vim-showmarks'
" Plugin 'PeterRincker/vim-argumentative'

" File-Type plugins
Plugin 'tpope/vim-haml'
Plugin 'vim-coffee-script'
Plugin 'xml.vim'
Plugin 'yaymukund/vim-rabl'
Plugin 'Handlebars'
Plugin '0robustus1/vim-tmux-conf'
Plugin 'mamut/vim-css-hex'
Plugin 'rizzatti/funcoo.vim'
Plugin 'cespare/vim-toml'
Plugin 'vim-erlang/vim-erlang-runtime'
Plugin 'vim-erlang/vim-erlang-compiler'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'vim-erlang/vim-erlang-tags'
Plugin 'elixir-lang/vim-elixir'
Plugin 'slim-template/vim-slim'
Plugin 'vim-scripts/sieve.vim'
Plugin 'parkr/vim-jekyll'
Plugin 'derekwyatt/vim-scala'

" Behaviour-Plugins
Plugin 'Raimondi/delimitMate'
Plugin '0robustus1/vim-borderless'
Plugin 'HTML-AutoCloseTag'
Plugin 'Indent-Guides'
Plugin 'LaTeX-Box'
Plugin 'SirVer/ultisnips'
Plugin 'Tabular'
Plugin 'a.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'buftabs'
Plugin 'commentary.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'cucumber.zip'
Plugin 'guns/vim-sexp'
Plugin 'jgdavey/tslime.vim'
Plugin 'rails.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'surround.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-scripts/marvim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-task'

" Mixed-Plugins
Plugin 'wannesm/wmgraphviz.vim'
Plugin 'rodjek/vim-puppet'

" Color-Schemes
Plugin 'reedes/vim-colors-pencil'
Plugin 'mrkn/mrkn256.vim'
Plugin 'romainl/flattened'
Plugin 'farseer90718/flattr.vim'

" Plugin 'tpope/vim-markdown'
Plugin 'plasticboy/vim-markdown'
call vundle#end()

syntax on
filetype plugin indent on

" #################
" # View Settings #
" #################

set history=50 " keep 50 lines of command line history
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
"set incsearch " do incremental searching
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
set linebreak
" set showbreak=↪
set showbreak=↳
set breakindent
" Saving the options is problematic when loading the session with regards to
" syntax highlighting, and probably other stuff
set sessionoptions-=options

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

let g:delimitMate_autoclose=1
let delimitMate_autoclose=1
let b:delimitMate_autoclose=1

" #################################
" # File-Type and Syntax Settings #
" #################################

au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars
au BufRead,BufNewFile *.rake,*.cap set ft=ruby
au BufRead,BufNewFile *.muttrc set ft=muttrc
au FileType clojure let b:delimitMate_quotes = "\""
" Crude solution for jekyll YAML-Frontmatter:
" http://www.codeography.com/2010/02/20/making-vim-play-nice-with-jekylls-yaml-front-matter.html
autocmd BufNewFile,BufRead index.slim,about.markdown,*/_drafts/*.markdown,*/_layouts/*.slim,*/_posts/*.markdown syntax match Comment /\%^---\_.\{-}---$/

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
" set smartindent

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
autocmd BufRead,BufNewFile *.kd set filetype=mkd
autocmd BufRead,BufNewFile *.thor set filetype=ruby
autocmd BufRead,BufNewFile Guardfile set filetype=ruby
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead *.pde set filetype=arduino
autocmd BufRead,BufNewFile *.ino set filetype=arduino
autocmd BufRead,BufNewFile *.abnf set filetype=abnf

autocmd FileType rust set softtabstop=2 tabstop=2 shiftwidth=2

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

" jumps to next/previous item in quickfix-list
nnoremap <Left> :cprev<cr>
nnoremap <Right> :cnext<cr>
" deactivate highlight after search
nnoremap <F9> :noh<return><esc>
nnoremap <leader>w <C-w>v<C-w>l
" For vim-Task Commands.
" inoremap <silent> <buffer> <F4> <ESC>:call Toggle_task_status()<CR>i
" nnoremap <silent> <buffer> <F4> :call Toggle_task_status()<CR>
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
" Per default would insert last-inserted text and return to normal mode
" but i hit it by accident, so i'll deactivate it.
" By the way, it is triggered by pressing Control and Spacebar.
imap <C-@> <Nop>

" Sometimes it takes to long for
" the leader key to be processed.
" this sets only for mappings, as long as ttimeoutlen is set
set timeoutlen=800
" if the value is positive it sets timeout for key codes.
set ttimeoutlen=50

" ###############
" Abbreviations #
" ###############
source ~/.vim/abbreviations.vim

" ###########################
" Plugin-dependent settings #
" ###########################

" LaTeX-Box #
" ###########

let g:LatexBox_viewer="open -a Skim"
" let g:LatexBox_autojump=1
au BufRead,BufNewFile *.tex let b:main_tex_file=getcwd()."/document.tex"

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
set wildignore+=*.so,*.swp,*.zip,*.jar,*.class,*.dependencies,*.beam
set wildignore+=*/ebin/*
set wildignore+=*/tmp/*

" #########################
" Stupid Stuff Prevention #
" #########################

" Preventing Lines which are too
" long, by warning me.
set columns=80
augroup line_too_long_group
  autocmd BufEnter * highlight LineTooLong cterm=bold
  autocmd BufEnter * match LineTooLong /\%81v.*/
augroup END
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

nnoremap <space> :make<cr>

" layout stuff #
" ##############

set conceallevel=3
autocmd FileType c set conceallevel=0

set list
set listchars=tab:>·,trail:·
set linebreak

" set foldmethod=syntax
" set foldlevelstart=5

" ################################
" Functions and related Mappings #
" ################################
"

source ~/.vim/arbitrary-functions.vim
source ~/.vim/plugin-like-functions.vim

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

" tslime.vim #
" ############

" vmap <C-c><C-c> <Plug>SendSelectionToTmux
" nmap <C-c><C-c> <Plug>NormalModeSendToTmux
" nmap <C-c>r <Plug>SetTmuxVars

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
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
  "
  " bind \ (backward slash) to grep shortcut
  command! -nargs=+ -complete=file -bar Ag silent! grep! "<args>"|cwindow|redraw!
  command! -nargs=+ -complete=file -bar Agg silent! grep! <args>|cc1|redraw!
  noreabbrev ag Ag
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

nnoremap <leader>b :Gblame<return>

" speed-issues
" set synmaxcol=800
" let loaded_matchparen = 1

" git-gutter
let g:gitgutter_enabled = 0
noremap <F12> :GitGutterToggle<CR>

" Allow looking up manpages with :Man
runtime ftplugin/man.vim

" Deactivate 'clearing uses the current background color', with
" background color referring to the background color that was being
" set by the terminal emulator.'
set t_ut=

" === Plugin related settings ===
" ===============================

" = parkr/jekyll-vim =
let g:jekyll_post_extension = '.markdown'
" let g:jekyll_post_filetype = 'liquid'
" let g:jekyll_post_template =  [
"   \ '---',
"   \ 'layout: post',
"   \ 'title: "JEKYLL_TITLE"',
"   \ 'date: "JEKYLL_DATE"',
"   \ '---',
"   \ '']
" let g:jekyll_site_dir = '_site'
" let g:jekyll_build_command = 'jekyll --no-auto --no-server'
" =

" ===============================
