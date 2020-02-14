function! config#plug#LeaderF#preload() abort
  let g:Lf_ShortcutF = '<Plug>'
  let g:Lf_ShortcutB = '<Plug>'
  let g:Lf_CommandMap = {
    \ '<C-X>': ['<C-S>'],
    \ '<C-S>': ['<C-X>'],
    \ '<C-V>': ['<C-P>'],
    \ '<C-]>': ['<C-V>'],
  \ }
endfunction

