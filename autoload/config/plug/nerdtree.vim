function! config#plug#nerdtree#init() abort
  let g:NERDTreeWinSize=20
  let g:NERDTreeQuitOnOpen=1
  let g:NERDTreeChDirMode=1
  let g:NERDTreeShowHidden=0
  let g:NERDTreeIgnore=['\~$', '\.git$', '\.swp$', '__pycache__']
endfunction
