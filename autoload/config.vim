" <chenxu2048@gmail.com>
" date: Tue May 15 19:50:07 CST 2018
function! config#init()
  call s:set_term()
  call s:set_editor()
  call s:set_cursor()

  set mouse=a
  set mousemodel=extend
  set guifont=DejaVu\ Sans\ Mono\ 10,\ Bitstream\ Vera\ Sans\ Mono\ 10
  set guifontwide=Microsoft\ Yahei\ 10
  set guioptions-=T
  set guioptions-=L
  set guioptions-=r
  set guioptions-=m
  set guiheadroom=0

  colorscheme molokai

  call patch#tmux()
  call patch#meta()
endfunction

function! s:set_term()
  set encoding=utf-8
  set t_Co=256
endfunction

function! s:set_editor()
  set list
  set listchars=tab:›.,trail:•,extends:…,nbsp:.

  set nu
  set smarttab
  set tabstop=4      " the width of '\t' to display
  set softtabstop=2  " how many ' ' or '\t' to insert to simulate tabstop?
  set shiftwidth=2   " the width of indent ???
  set expandtab

  set relativenumber

  set completeopt-=preview

  set nofoldenable
  set foldmethod=indent

  set laststatus=2
  set incsearch
  set backspace=indent,eol,start
  set showcmd
endfunction

function! s:set_cursor()
  set cursorcolumn
  set cursorline
  highlight CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE
  highlight CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE
endfunction
