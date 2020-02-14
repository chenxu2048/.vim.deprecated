" ==============================================================================
"                             SETTING OF AIRLINE
" ==============================================================================

function! config#plug#airline#init()
  let g:airline_theme = 'dark'

  call config#plug#airline#set_section()
  call config#plug#airline#set_symbol()
  call config#plug#airline#set_extensions()

endfunction


let s:airline_cwd_max_len = 30

function! config#plug#airline#cwd_max(max_len)
  let s:airline_cwd_max_len = a:max_len
endfunction

function! config#plug#airline#getcwd()
  let l:max_len = get(s:, 'airline_cwd_max_len', 30)
  if empty(airline#extensions#branch#head())
    let l:cwd = getcwd()
    if strlen(l:cwd) > l:max_len
      return '...' . matchstr(l:cwd, '.\{' . (l:max_len - 3) . '}$')
    else
      return l:cwd
    endif
  else
    return ''
  endif
endfunction

function! config#plug#airline#set_symbol() abort
  let g:airline_left_sep=' ▶'
  let g:airline_left_alt_sep='>'
  let g:airline_right_sep='◀ '
  let g:airline_right_alt_sep='<'
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_symbols.branch = ''
  let g:airline_symbols.crypt = '🔒'
endfunction

function! config#plug#airline#set_section() abort
  let g:airline_skip_empty_sections = 1
  call airline#parts#define_function('getcwd', 'config#plug#airline#getcwd')
  call airline#parts#define_raw('lines', '%4l')
  call airline#parts#define_accent('lines', 'bold')
  call airline#parts#define_raw('maxlines', '%L')
  call airline#parts#define_accent('maxlines', 'bold')

  call airline#parts#define_raw('percentage', '%3p%%')
  call airline#parts#define_raw('columns', '%v')

  let g:airline_section_b = airline#section#create(['branch', 'getcwd'])

  let g:airline_section_z = airline#section#create(['percentage', '|', 'lines', '/', 'maxlines', '|', 'columns'])
endfunction

function! config#plug#airline#ext_tabline() abort
  " extension tabline
  let g:airline#extensions#tabline#close_symbol = 'X'
  let g:airline#extensions#tabline#show_tab_nr = 1
  let g:airline#extensions#tabline#show_buffers = 1
  let g:airline#extensions#tabline#show_tabs = 1
  let g:airline#extensions#tabline#show_close_button = 1
  let g:airline#extensions#tabline#tab_nr_type = 1
endfunction

function! config#plug#airline#ext_ycm() abort
  " extension ycm
  let g:airline#extensions#ycm#enabled = 1
  let g:airline#extensions#ycm#warning_symbol = 'W:'
  let g:airline#extensions#ycm#error_symbol = 'E:'
endfunction

function! config#plug#airline#ext_ctrlp() abort
  " extension ctrlp
  let g:airline#extensions#ctrlp#color_template = 'insert'
endfunction

function! config#plug#airline#ext_branch() abort
  " extension branch
  let g:airline#extensions#branch#enabled = 1
endfunction

function! config#plug#airline#set_extensions() abort
  let g:airline_extensions = ['tabline', 'branch', 'ycm', 'ctrlp']

  " let g:airline#extensions#default#section_truncate_width = {
  "     \ 'b': 79,
  "     \ 'x': 60,
  "     \ 'y': 88,
  "     \ 'z': 45,
  "     \ 'warning': 80,
  "     \ 'error': 80,
  "     \ }

  let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ [ 'x', 'y', 'z', 'error', 'warning' ]
      \ ]

  let g:airline#extensions#buffer#enabled = 1
  call config#plug#airline#ext_branch()
  call config#plug#airline#ext_ctrlp()
  call config#plug#airline#ext_ycm()
  call config#plug#airline#ext_tabline()
endfunction
