let s:home = expand('<sfile>:p:h')

function! s:check(dir, name)
  let l:name = a:name . '.vim'
  let l:filename = join([s:home, a:dir, l:name], '/')
  return filereadable(expand(l:filename))
endfunction

function! s:hook(name, funcname) abort
  for l:dir in ['config', 'keymap']
    if s:check(l:dir . '/plug', a:name)
      try
        call call(l:dir . '#plug#' . a:name . '#' . a:funcname , [])
      catch /^Vim\%((\a\+)\)\=:E117/
        " echom v:exception
      endtry
    endif
  endfor
endfunction

function! utils#preload_hook(name) abort
  call s:hook(a:name, 'preload')
endfunction

function! utils#loaded_hook(name) abort
  call s:hook(a:name, 'init')
endfunction

function! utils#format_plugin_name(name) abort
  let l:name = substitute(a:name, '[.-]', '_', 'g')
  return substitute(l:name, '\(_vim\|vim_\|[^a-zA-Z0-9_]\)', '', 'g')
endfunction

function! utils#reload() abort
  let l:functions = split(execute('function'), '\n')
  for l:func in l:functions
    let l:funcname = matchstr(l:func, ' \@<=\(keymap\|option\|config\|plugin\).*#.*(\@=')
    if !empty(l:funcname)
      execute 'delfunction ' . l:funcname
    endif
  endfor
  doautocmd User ReloadConfig
endfunction
