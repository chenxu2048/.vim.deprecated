function! keymap#plug#LeaderF#init() abort
  nnoremap <silent> <leader>ff     :<C-U>LeaderfFile<cr>
  nnoremap <silent> <leader>fF     :<C-U>LeaderFileFullScreen<cr>
  nnoremap <silent> <leader>fb     :<C-U>LeaderfBuffer<cr>
  nnoremap <silent> <leader>fB     :<C-U>LeaderfBufferAll<cr>
  nnoremap <silent> <leader>fm     :<C-U>LeaderfMru<cr>
  nnoremap <silent> <leader>fM     :<C-U>LeaderfMruCwd<cr>
  nnoremap <silent> <leader>fu     :<C-U>LeaderfFunction<cr>
  nnoremap <silent> <leader>fU     :<C-U>LeaderfFunctionAll<cr>
  nnoremap <silent> <leader>fl     :<C-U>LeaderfLine<cr>
  nnoremap <silent> <leader>fL     :<C-U>LeaderfLineAll<cr>
  nnoremap <silent> <leader>fhc    :<C-U>LeaderfHistoryCmd<cr>
  nnoremap <silent> <leader>fhs    :<C-U>LeaderfHistorySearch<cr>

  nnoremap <silent> <leader>f<M-f> :<C-U>LeaderfSelf<cr>
endfunction
