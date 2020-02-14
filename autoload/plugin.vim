function! plugin#init(vim_plug_path) abort
  " add vim-plug to runtimepath
  execute 'set rtp+=' . a:vim_plug_path
  " load plug script. since it not in 
  runtime plug.vim
  call config#plug#init()
endfunction

let s:loaded = {}

function! plugin#begin(...) abort
  call call('plug#begin', a:000)
  call s:HijackPlug()
endfunction

function! plugin#end(...) abort
  call call('plug#end', a:000)
  for l:plug_name in keys(s:loaded)
    call s:loaded_hook(l:plug_name)
  endfor
endfunction

function! s:HijackPlug() abort
  command! -nargs=* -bar Plug call plugin#add_plug(<args>)
endfunction

function! plugin#add_plug(...) abort
  let l:plug_name = substitute(a:1, '^.*/', '', 'g')
  if a:0 > 1 && !empty(get(a:2, 'as', ''))
    let l:plug_name = a:2['as']
  endif

  call utils#preload_hook(utils#format_plugin_name(l:plug_name))
  call call('plug#', a:000)

  if a:0 > 1 && (has_key(a:2, 'for') || has_key(a:2, 'on'))
    " demand load
    augroup PlugLoaded
      execute 'autocmd! User ' . l:plug_name . ' call <SID>loaded_hook("' . l:plug_name . '")'
    augroup END
  else
    let s:loaded[l:plug_name] = 1
  endif
endfunction

function! s:loaded_hook(name) abort
  call utils#loaded_hook(utils#format_plugin_name(a:name))
  let s:loaded[a:name] = 1
endfunction
