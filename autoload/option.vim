let g:vim_plug_home = expand(substitute(get(g:, 'vim_plug_home', '~/.vim/plug'), '/$', '/', ''))
let g:vim_plug_git = get(g:, 'vim_plug_git', 'https://github.com/junegunn/vim-plug.git')

function! option#init(...) abort
  if a:0 > 0 && type(a:1) == type('')
    let l:vim_plug_path = a:1
  else
    let l:vim_plug_path = expand(g:vim_plug_home . '/' . 'vim-plug')
  endif
  let l:vim_plug_path = expand(l:vim_plug_path)
  if !isdirectory(l:vim_plug_path)
    call option#install_plug(l:vim_plug_path)
  endif

  call plugin#init(l:vim_plug_path)

  call config#init()
  call keymap#init()

  call s:hijack_netrw()
endfunction

function! option#install_plug(vim_plug) abort
  execute 'silent !mkdir -p ' . a:vim_plug
  execute 'silent !git clone ' . g:vim_plug_git . ' ' . a:vim_plug
endfunction

function! s:hijack_netrw() abort
  augroup HijackFileExplorer
    autocmd!
    autocmd VimEnter * silent! autocmd! FileExplorer
    autocmd VimEnter * call option#load_nerdtree(expand('<amatch>'))
  augroup END
endfunction

function! option#load_nerdtree(dir) abort
  if !isdirectory(a:dir)
      return
  endif
  set filetype=nerdtree
  " call plug#load('nerdtree')
  " call utils#loaded_hook('nerdtree')
  autocmd! HijackFileExplorer
  execute 'cd '. a:dir
  call g:NERDTreeCreator.CreateWindowTree(a:dir)
endfunction
