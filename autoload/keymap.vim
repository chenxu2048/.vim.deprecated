function! keymap#init() abort
  call keymap#vim_keymap()
  call keymap#terminal()
endfunction

function! keymap#vim_keymap() abort
  noremap <silent><leader><M-v> :map<cr>
  noremap <silent><leader><M-v><M-m> :messages<cr>
  noremap <silent><leader><M-v><M-e> :tabedit $VIMRC<cr>
  noremap <silent><leader><M-v><M-q> :qa!<cr>
  noremap <silent><leader><M-v>t :tabs<cr>
  noremap <silent><leader><M-v>r :delfunction utils#reload \| call utils#reload()<cr>
endfunction

function! keymap#terminal() abort
  tnoremap <Esc> <C-w>N
endfunction

" let s:autoload = expand('<sfile>:h:p')

" function! keymap#always() abort
"   let l:cwd = getcwd()
"   execute 'cd ' . s:autoload
"   call s:load_always('./keymap')
"   execute 'cd ' . l:cwd
" endfunction

" function! s:load_always(dir) abort
"   let l:subfiles = split(globpath(a:dir, '*'))
"   for l:file in l:subfiles
"     if isdirectory(l:file)
"       call s:load_always(l:file)
"     elseif !empty(matchstr(l:file, '\./[a-zA-Z0-9/_]*\.vim'))
"       let l:pathes = split(l:file[2: -5], '/')
"       try
"         call call(join(add(l:pathes, 'always'), '#'), [])
"       catch /^Vim\%((\a\+)\)\=:E117/
"       endtry
"     endif
"   endfor
" endfunction

