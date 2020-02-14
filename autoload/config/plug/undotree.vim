function! config#plug#undotree#preload() abort
  if has('persistent_undo')
    set undodir=$VIM_HOME/autoload/config/plug/undotree/
    set undofile
  endif

  let g:undotree_SetFocusWhenToggle = 1
endfunction
