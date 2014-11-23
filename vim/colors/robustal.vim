" Vim color file
"
" Author: Tim Reddehase <robustus@rightsrestricted.com>
" with special thanks to
" Tomas Restrepo <tomas@winterdom.com>
" and Steve Losh <steve@stevelosh.com>
" for the molokai theme and respective changes
"
"

hi clear
set background=dark
let g:colors_name="robustal"


" Support for 256-color terminals {{{
" if &t_Co > 255

  hi Cursor          ctermfg=NONE  ctermbg=255  cterm=NONE guifg=#1E1E1E guibg=#FFFFFF gui=NONE
  hi Debug           ctermfg=225   ctermbg=NONE cterm=bold guifg=#FFD7FF guibg=NONE    gui=bold

  hi Normal          ctermfg=255   ctermbg=NONE cterm=NONE guifg=#FFFFFF guibg=#000000 gui=NONE
  hi Comment         ctermfg=102   ctermbg=NONE cterm=NONE guifg=#878787 guibg=NONE    gui=NONE

  " in ruby: true, false
  " midnight blue
  hi Boolean         ctermfg=62    ctermbg=NONE cterm=NONE guifg=#5F5FD7 guibg=NONE    gui=NONE
  " in ruby: normal text, method calls
  hi Character       ctermfg=144   ctermbg=NONE cterm=NONE guifg=#AFAF87 guibg=NONE    gui=NONE
  " innocent green
  hi Number          ctermfg=65    ctermbg=NONE cterm=NONE guifg=#5F875F guibg=NONE    gui=NONE
  hi Float           ctermfg=65    ctermbg=NONE cterm=NONE guifg=#5F875F guibg=NONE    gui=NONE
  " in ruby, strings not symbols
  " present green
  hi String          ctermfg=71    ctermbg=NONE cterm=NONE guifg=#5FAF5F guibg=NONE    gui=NONE
  hi Conditional     ctermfg=76    ctermbg=NONE cterm=underline guifg=#5FD700 guibg=NONE gui=NONE
  " in ruby: symbols
  " sandy yellow
  hi Constant        ctermfg=136  ctermbg=NONE cterm=bold guifg=#AF8700 guibg=NONE gui=bold
  hi Typedef         ctermfg=81   ctermbg=NONE cterm=bold guifg=#5FD7FF guibg=NONE gui=NONE
  " in ruby: Classes, Modules
  hi Type            ctermfg=124  ctermbg=NONE cterm=NONE guifg=#AF0000 guibg=NONE gui=NONE
  " in ruby: instance and global variables
  hi Identifier      ctermfg=220  ctermbg=NONE cterm=NONE guifg=#FFD700 guibg=NONE gui=NONE
  " in ruby: def, class
  hi Define          ctermfg=166  ctermbg=NONE cterm=bold guifg=#D75F00 guibg=NONE gui=bold
  " in ruby: do blocks and return statements
  hi Statement       ctermfg=166  ctermbg=NONE cterm=none guifg=#D75F00 guibg=NONE gui=NONE
  " in ruby: method names in definition
  hi Function        ctermfg=118  ctermbg=NONE cterm=bold guifg=#87FF00 guibg=NONE gui=bold
  hi Delimiter       ctermfg=136  ctermbg=NONE cterm=bold guifg=#AF8700 guibg=NONE gui=bold

  " ########################
  " ruby specific settings #
  " ########################
  "
  hi rubyInstanceVariable ctermfg=220 ctermbg=NONE cterm=bold guifg=#FFD700 guibg=NONE gui=bold

  " hi EasyMotionTarget ctermfg=11
  " hi EasyMotionShade  ctermfg=8

  hi DiffAdd         ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#005F87 gui=NONE
  hi DiffChange      ctermfg=181  ctermbg=239 cterm=NONE guifg=#D7AFAF guibg=#4E4E4E gui=NONE
  hi DiffDelete      ctermfg=162  ctermbg=53  cterm=NONE guifg=#D70087 guibg=#5F005F gui=NONE
  hi DiffText        ctermfg=NONE ctermbg=102 cterm=bold guifg=NONE guibg=#878787 gui=NONE

  hi Directory       ctermfg=118 ctermbg=NONE   cterm=bold guifg=#87FF00 guibg=NONE gui=bold
  hi Error           ctermfg=219 ctermbg=89  cterm=NONE guifg=#FFAFFF guibg=#87005F gui=NONE
  hi ErrorMsg        ctermfg=199 ctermbg=16    cterm=bold guifg=#FF00AF guibg=#000000 gui=bold
  hi Exception       ctermfg=118 ctermbg=NONE  cterm=bold guifg=#87FF00 guibg=NONE gui=bold
  hi FoldColumn      ctermfg=67  ctermbg=233 cterm=NONE guifg=#5F87AF guibg=#121212 gui=NONE
  hi Folded          ctermfg=67  ctermbg=233 cterm=NONE guifg=#5F87AF guibg=#121212 gui=NONE
  hi Ignore          ctermfg=244 ctermbg=232 cterm=NONE guifg=#808080 guibg=#080808 gui=NONE
  hi IncSearch       ctermfg=193 ctermbg=16  cterm=NONE guifg=#D7FFAF guibg=#000000 gui=NONE

  hi Keyword         ctermfg=161 ctermbg=NONE  cterm=bold guifg=#D7005F guibg=NONE gui=bold
  hi Label           ctermfg=229 ctermbg=NONE  cterm=NONE guifg=#FFFFAF guibg=NONE gui=NONE
  hi Macro           ctermfg=193 ctermbg=NONE cterm=NONE guifg=#D7FFAF guibg=NONE gui=NONE
  hi SpecialKey      ctermfg=81 ctermbg=NONE cterm=NONE guifg=#5FD7FF guibg=NONE gui=NONE
  hi MailHeaderEmail ctermfg=3  ctermbg=233  cterm=NONE guifg=#030303 guibg=#121212 gui=NONE
  hi MailEmail       ctermfg=3  ctermbg=233  cterm=NONE guifg=#030303 guibg=#121212 gui=NONE

  hi MatchParen      ctermfg=16  ctermbg=208 cterm=bold,underline guifg=#000000 guibg=#FF8700 gui=bold,underline
  hi ModeMsg         ctermfg=229 ctermbg=NONE cterm=NONE guifg=#FFFFAF guibg=NONE gui=NONE
  hi MoreMsg         ctermfg=229 ctermbg=NONE cterm=NONE guifg=#FFFFAF guibg=NONE gui=NONE
  hi Operator        ctermfg=161 ctermbg=NONE cterm=NONE guifg=#D7005F guibg=NONE gui=NONE

  " complete menu
  hi Pmenu           ctermfg=81  ctermbg=16 cterm=NONE guifg=#5FD7FF guibg=#000000 gui=NONE
  hi PmenuSel        ctermfg=NONE  ctermbg=244 cterm=NONE guifg=NONE guibg=#808080 gui=NONE
  hi PmenuSbar       ctermfg=NONE ctermbg=232 cterm=NONE guifg=NONE guibg=#080808 gui=NONE
  hi PmenuThumb      ctermfg=81 ctermbg=NONE cterm=NONE guifg=#5FD7FF guibg=NONE gui=NONE

  hi PreCondit       ctermfg=118 ctermbg=NONE  cterm=bold guifg=#87FF00 guibg=NONE gui=bold
  hi PreProc         ctermfg=118 ctermbg=NONE cterm=NONE guifg=#87FF00 guibg=NONE gui=NONE
  hi Question        ctermfg=81 ctermbg=NONE cterm=NONE guifg=#5FD7FF guibg=NONE gui=NONE
  hi Repeat          ctermfg=161 ctermbg=NONE cterm=bold guifg=#D7005F guibg=NONE gui=bold
  hi Search          ctermfg=253 ctermbg=66 cterm=NONE guifg=#DADADA guibg=#5F8787 gui=NONE

  " marks column
  hi SignColumn      ctermfg=118 ctermbg=235 cterm=NONE guifg=#87FF00 guibg=#262626 gui=NONE
  hi SpecialChar     ctermfg=161 ctermbg=NONE cterm=bold guifg=#D7005F guibg=NONE gui=bold
  hi SpecialComment  ctermfg=245 ctermbg=NONE cterm=bold guifg=#8A8A8A guibg=NONE gui=bold
  hi Special         ctermfg=81  ctermbg=232 cterm=NONE guifg=#5FD7FF guibg=#080808 gui=NONE
  hi SpecialKey      ctermfg=245 ctermbg=NONE cterm=NONE guifg=#8A8A8A guibg=NONE gui=NONE

  hi StatusLine      ctermfg=130 ctermbg=15 cterm=NONE guifg=#AF5F00 guibg=#000000 gui=NONE
  hi StatusLineNC    ctermfg=242 ctermbg=15 cterm=NONE guifg=#6C6C6C guibg=#000000 gui=NONE
  hi StorageClass    ctermfg=208 ctermbg=NONE cterm=NONE guifg=#FF8700 guibg=NONE gui=NONE
  hi Structure       ctermfg=81 ctermbg=NONE cterm=NONE guifg=#5FD7FF guibg=NONE gui=NONE
  hi Tag             ctermfg=161 ctermbg=NONE cterm=NONE guifg=#D7005F guibg=NONE gui=NONE
  hi Title           ctermfg=166 ctermbg=NONE cterm=NONE guifg=#D75F00 guibg=NONE gui=NONE
  hi Todo            ctermfg=231 ctermbg=232   cterm=bold guifg=#FFFFFF guibg=#080808 gui=bold

  hi Underlined      ctermfg=244 ctermbg=NONE  cterm=underline guifg=#808080 guibg=NONE gui=underline

  hi VertSplit       ctermfg=244 ctermbg=232   cterm=bold guifg=#808080 guibg=#080808 gui=bold
  hi VisualNOS       ctermfg=NONE ctermbg=238 cterm=NONE guifg=NONE guibg=#444444 gui=NONE
  hi Visual          ctermfg=NONE ctermbg=235 cterm=NONE guifg=NONE guibg=#262626 gui=NONE
  hi WarningMsg      ctermfg=231 ctermbg=238   cterm=bold guifg=#FFFFFF guibg=#444444 gui=bold
  hi WildMenu        ctermfg=81  ctermbg=16 cterm=NONE guifg=#5FD7FF guibg=#000000 gui=NONE

  hi CursorLine      ctermfg=NONE ctermbg=234  cterm=NONE guifg=NONE guibg=#1C1C1C gui=NONE
  hi CursorColumn    ctermfg=NONE ctermbg=234 cterm=NONE guifg=NONE guibg=#1C1C1C gui=NONE
  hi ColorColumn     ctermfg=NONE ctermbg=234 cterm=NONE guifg=NONE guibg=#1C1C1C gui=NONE
  hi LineNr          ctermfg=250 ctermbg=233 cterm=NONE guifg=#BCBCBC guibg=#121212 gui=NONE
  hi NonText         ctermfg=240 ctermbg=233 cterm=NONE guifg=#585858 guibg=#121212 gui=NONE
" end " }}}
