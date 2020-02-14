function! keymap#plug#undotree#init() abort
  nnoremap <silent> <leader>uu :<C-U>UndotreeToggle<cr>
  nnoremap <silent> <leader>uf :<C-U>UndotreeFocus<cr>
endfunction
