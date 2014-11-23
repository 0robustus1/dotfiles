if has("gui_macvim")
  " macmenu &File.New\ Tab key=<nop>
  macmenu File.Print key=<nop>
  map <D-p> :call SafeCtrlP()<CR>
endif
