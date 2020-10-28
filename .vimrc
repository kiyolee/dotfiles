"
" .vimrc
"

if version >= 602

if has("win32")
  let g:my_vim=$HOME . "/_vim"
else
  let g:my_vim=$HOME . "/.vim"
endif

if !has("dos16")

  let &g:runtimepath=$VIMRUNTIME . "," . g:my_vim

  function My_vim(fn)
    return g:my_vim . a:fn
  endfunction
  function My_local_vim(fn)
    return g:my_vim . "/local/" . a:fn
  endfunction
  function My_local_filetype_vim(fn)
    return g:my_vim . "/local/filetype/" . a:fn
  endfunction

  if filereadable(My_local_vim("commonrc.vim"))
    exec "source " . My_local_vim("commonrc.vim")
  endif

endif

if !has("gui_running")
  "
  " with out gui
  "
  if !has("dos32") && !has("dos16")
    colorscheme default
  else
    colorscheme default
  endif

else
  "
  " with gui
  "
  set mousehide
  set novb

  if has("gui_win32")
    "
    " win32
    "
    source $VIMRUNTIME/mswin.vim
    behave xterm

    set gfn=lucida_console:h8
    set columns=100
    set lines=50

  elseif has("gui_macvim")
    "
    " mac
    "
    source $VIMRUNTIME/mswin.vim
    behave xterm

    set gfn=lucida_console:h8
    set columns=200
    set lines=66

  elseif has("x11")
    "
    " x11
    "
    if has("gui_gtk2")
      set gfn=LucidaTypewriter\ 10
    else
      set gfn=-*-lucidatypewriter-medium-r-normal-*-10-*
    endif
    set columns=120
    set lines=60

  endif

  colorscheme peachpuff

  if has("gui_win32")
    au GUIEnter * simalt ~x
  endif

endif

set encoding=utf-8

endif " version >= 602

if filereadable(My_local_vim("localrc.vim"))
  exec "source " . My_local_vim("localrc.vim")
endif

" unlet g:my_vim

" vim:sts=2:sw=2:ts=8:et:syntax=vim
