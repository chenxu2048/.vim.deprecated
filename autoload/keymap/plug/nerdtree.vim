function! keymap#plug#nerdtree#init() abort
endfunction

function! keymap#plug#nerdtree#preload() abort
  nnoremap <silent><leader>nt :NERDTreeToggle<cr>
  nnoremap <silent><leader>nf :NERDTreeFocus<cr>
endfunction
