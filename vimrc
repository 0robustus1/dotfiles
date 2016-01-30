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

" the base plugin, used to manage others
Plugin 'VundleVim/Vundle.vim'

" Unused #
" ########
" Plugin 'othree/html5.vim'
" Plugin 'wting/rust.vim'
" Plugin 'faith/vim-go'
" Plugin 'kana/vim-fakeclip'
" Plugin 'jacquesbh/vim-showmarks'
" Plugin 'PeterRincker/vim-argumentative'
" Plugin 'yaymukund/vim-rabl'
" Plugin 'Handlebars'
" Plugin 'cespare/vim-toml'
" Plugin 'derekwyatt/vim-scala'
" Plugin 'HTML-AutoCloseTag'
" Plugin 'LaTeX-Box'
" Plugin 'cucumber.zip'
" Plugin 'thoughtbot/vim-rspec'

" Library for usage in other plugins
Plugin 'rizzatti/funcoo.vim'

" File-Type plugins #
" ###################
"
" Syntax Plugin for HAML - compiles to HTML
Plugin 'tpope/vim-haml'
" Syntax Plugin for Coffee Script - compiles to Javascript
Plugin 'kchmck/vim-coffee-script' " Plugin 'vim-coffee-script'
" Syntax Plugin for XML
Plugin 'othree/xml.vim' " Plugin 'xml.vim'
" Custom Syntax Plugin for the tmux config - use the official one instead
Plugin '0robustus1/vim-tmux-conf'
" Highlights CSS-Colorcodes with the color they represent
Plugin 'mamut/vim-css-hex'
" Erlang Plugins to interact with compiler, syntax, omnicomplete and ctags
Plugin 'vim-erlang/vim-erlang-runtime'
Plugin 'vim-erlang/vim-erlang-compiler'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'vim-erlang/vim-erlang-tags'
" Syntax Highlighting for Elixir
Plugin 'elixir-lang/vim-elixir'
" Syntax Highlighting for Slim - compiles to HTML
Plugin 'slim-template/vim-slim'
" Syntax Highlighting for Sieve-Scripts - used for E-Mail filtering
Plugin 'vim-scripts/sieve.vim'
" Plugin for Interaction with Jekyll-Blogs, building running, creating posts
Plugin 'parkr/vim-jekyll'
" Well it is for CSV files
Plugin 'chrisbra/csv.vim'

" Behaviour-Plugins #
" ###################
"
" Adds autoclosing of quotes, parenthesis, brackets and the like
" Plugin 'Raimondi/delimitMate'
" Navigate across the border of a tab into another tab when switching windows
Plugin '0robustus1/vim-borderless'
" Visually displays indentation inside files
Plugin 'nathanaelkane/vim-indent-guides' " Plugin 'Indent-Guides'
" Handle snippets of code at the press of a (completion-) button
Plugin 'SirVer/ultisnips'
" Tabularize/Align content at your will
Plugin 'godlygeek/tabular' " Plugin 'Tabular'
" Easily toggle between .c and .h files (Code and Header)
Plugin 'taxilian/a.vim' " Plugin 'a.vim'
" Displays a column to the left which denotes additions/deletions/changes
Plugin 'airblade/vim-gitgutter'
" Display tab-like list of buffers in the bottom of a window
Plugin 'vim-scripts/buftabs' " Plugin 'buftabs'
" Easily toggle lines as comments, or not
Plugin 'tpope/vim-commentary' " Plugin 'commentary.vim'
" Allows project navigation with fuzzy-file-finding
" Plugin 'kien/ctrlp.vim'
" Mappings for working with S-Expressions - think lisp
Plugin 'guns/vim-sexp'
" Make the S-Expression mappings more human friendly
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
" More current ruby integration for vim
Plugin 'vim-ruby/vim-ruby'
" Rails integration for vim for power engineers
Plugin 'tpope/vim-rails' " Plugin 'rails.vim'
" Integration with the Dash (Mac OS X) App, to lookup offline documentation
Plugin 'rizzatti/dash.vim'
" Surround stuff with stuff, mostly text with parentheses and quotes
Plugin 'tpope/vim-surround' " Plugin 'surround.vim'
" End (code-) blocks automatically, e.g. an 'end' for each 'def' in ruby
Plugin 'tpope/vim-endwise'
" An integrated REPL for clojure
Plugin 'tpope/vim-fireplace'
" Integration (Browsing, Blaming, Committing) of git into vim
Plugin 'tpope/vim-fugitive'
" Enhances the built-in directory browser (netrw)
Plugin 'tpope/vim-vinegar'
" Store macros persistently and reuse them by name
Plugin 'vim-scripts/marvim'
" Browse tags (generated by ctags) easily in vim
Plugin 'vim-scripts/taglist.vim'
" Working with Task-File to get-things-done
Plugin 'samsonw/vim-task' " Plugin 'vim-task'
" Allows executing tasks asynchronously in a tmux pane
Plugin 'tpope/vim-dispatch'
" Allows <C-a> and <C-x> to increment/decrement dates
Plugin 'tpope/vim-speeddating'
" Allows . to also repeat some plugin usages
Plugin 'tpope/vim-repeat'
" Allow to take a look at the actual undo tree of vim
Plugin 'sjl/gundo.vim'
" The probably mightiest fuzzy-finder
Plugin 'Shougo/unite.vim'
" Unite Plugin to use Ag
" Plugin 'Slava/vim-unite-files-ag' " I believe i don't actually use it
" Run and display/describe rake tasks easily
" Plugin 'ujihisa/unite-rake' " doesn't seem to work
" Use the tig git browser in vim
Plugin 'Kocha/vim-unite-tig'
" Tasklist in unite, manage your tasks
Plugin 'junkblocker/unite-tasklist'
" Dependency of unite-issue; allows vim to talk to webapis via curl/wget
Plugin 'mattn/webapi-vim'
" Dependency of unite-issue; open urls in browser
Plugin 'tyru/open-browser.vim'
" Unite-Integration with Issue-Systems (GitHub,JIRA)
" Plugin 'rafi/vim-unite-issue'
" Tag support in unite
Plugin 'tsukkee/unite-tag'
" Unite the Rails, yeah!
Plugin 'basyura/unite-rails'
Plugin 'Slava/vim-unite-files-ag'
" The power of custom textobjects (e.g. w is a textobj)
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
" Like delimitMate but hopefully without problems and the annoyingness
Plugin 'jiangmiao/auto-pairs'
" Like magit (emacs) but for vim
Plugin 'jreybert/vimagit'
" Dependency of vim-lua-ftplugin. Contains plugin independent vimscript
" framework
Plugin 'xolox/vim-misc'
" Some nice lua checking and documentation things
Plugin 'xolox/vim-lua-ftplugin'
" Writing html in a more elegant way.
" This is kind of like a vim-DSL for html
Plugin 'mattn/emmet-vim'


" Mixed-Plugins
"
" Compiling and Working with dot-files to create graphs with graphviz
Plugin 'wannesm/wmgraphviz.vim'
" Syntax-Highlighting and nice integrations for the puppet
" automation/provisioning tools
Plugin 'rodjek/vim-puppet'
" Stuff for Markdown (Syntax-Highlighting and the like)
Plugin 'plasticboy/vim-markdown'

" Color-Schemes
Plugin 'reedes/vim-colors-pencil'
Plugin 'mrkn/mrkn256.vim'
Plugin 'romainl/flattened'
Plugin 'farseer90718/flattr.vim'

call vundle#end()

syntax on
filetype plugin indent on
" needed by 'nelstrom/vim-textobj-rubyblock'
runtime macros/matchit.vim

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
au FileType xml set formatprg=xmllint\ --format\ -
au FileType json set formatprg=jq\ '.'
au FileType eruby,html let b:delimitMate_autoclose=0
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


" ##########
" Quickfix #
" ##########

" support rspec reports
" set errorformat+=%f:%l\ %n\ %m
" autocmd FileType rspec setlocal errorformat=%f:%l\ %n\ %m
" autocmd BufRead,BufNewFile *_spec.rb setlocal errorformat=%f:%l\ %n\ %m
autocmd BufRead,BufNewFile *_spec.rb compiler rspec
nnoremap <leader>rl :silent! Dispatch -compiler=rspec -dir=<c-r>=getcwd()<cr> rspec %\:<c-r>=line(".")<cr><cr>
nnoremap <leader>rf :silent! Dispatch -compiler=rspec -dir=<c-r>=getcwd()<cr> rspec %<cr>
nnoremap <leader>rs :silent! Dispatch -compiler=rspec -dir=<c-r>=getcwd()<cr> rspec<cr>

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
nnoremap <F1> <ESC>
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
set wildignore+=*/Applications/*
set wildignore+=*/Library/*

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
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

nnoremap <leader>b :Gblame<return>
nnoremap <leader>B :Gbrowse <c-r>=expand("<cword>")<return><return>

" Settings to set unite.vim up the way i will like it
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_length'])
call unite#custom#source('file,file/new,buffer,file_rec,line', 'matchers', 'matcher_fuzzy')
call unite#custom#source('file_rec', 'ignore_globs', split(&wildignore, ','))

nnoremap <leader>f :Unite -buffer-name=search-file -start-insert file_rec<cr>
" nnoremap <c-p> :Unite -buffer-name=search-file -start-insert file_rec<cr>
nnoremap <c-p> :Unite -buffer-name=search-file -start-insert files_ag<cr>

augroup unite_mappings
  au FileType unite nmap <buffer> <c-k> <Plug>(unite_cursor_up)
  au FileType unite nmap <buffer> <c-j> <Plug>(unite_cursor_down)
  au FileType unite imap <buffer> <c-k> <Plug>(unite_select_previous_line)
  au FileType unite imap <buffer> <c-j> <Plug>(unite_select_next_line)
augroup END
" nnoremap <C-k> :<C-u>Unite -buffer-name=search -start-insert line<cr>

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

augroup gzip
  autocmd!
  autocmd BufReadPre,FileReadPre *.gz set bin
  autocmd BufReadPost,FileReadPost *.gz '[,']!gunzip
  autocmd BufReadPost,FileReadPost *.gz set nobin
  autocmd BufReadPost,FileReadPost *.gz execute ":doautocmd BufReadPost " . expand("%:r")
  autocmd BufWritePost,FileWritePost *.gz !mv <afile> <afile>:r
  autocmd BufWritePost,FileWritePost *.gz !gzip <afile>:r

  autocmd FileAppendPre    *.gz !gunzip <afile>
  autocmd FileAppendPre    *.gz !mv <afile>:r <afile>
  autocmd FileAppendPost   *.gz !mv <afile> <afile>:r
  autocmd FileAppendPost   *.gz !gzip <afile>:r
augroup END

let g:magit_show_help = 0
