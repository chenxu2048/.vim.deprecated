
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

let mapleader = ' '

if exists("s:loaded")
  finish
endif
let s:loaded = 1

augroup ReloadGp
  autocmd!
  autocmd! User ReloadConfig call option#init()
augroup END

let $VIM_HOME = expand('<sfile>:h:p')

doautocmd User ReloadConfig
