function! config#plug#init()

  call plugin#begin('~/.vim/plug')

  " ==============================================================================
  "                                PLUGIN LIST
  "

  Plug 'tpope/vim-commentary'                 " 据说是快速注释
  Plug 'vim-airline/vim-airline'              " 据说是优雅的状态栏
  Plug 'vim-airline/vim-airline-themes'       " 据说vim-airline没有主题了
  Plug 'scrooloose/nerdtree',
    \ {
      \ 'for': 'nerdtree',
      \ 'on': ['NERDTree', 'NERDTreeToggle']
    \ }                                       " nerdtree
  Plug 'Xuyuanp/nerdtree-git-plugin'          " nerdtree git插件

  Plug 'tpope/vim-fugitive' 
  Plug 'mbbill/undotree'
  Plug 'kien/ctrlp.vim',
    \ {
      \ 'as': 'ctrlp',
    \ }
  Plug 'spf13/vim-autoclose'
  Plug 'mhinz/vim-signify'
  Plug 'hecal3/vim-leader-guide'
  Plug 'skywind3000/asyncrun.vim'
  Plug 'Valloric/YouCompleteMe', 
    \ {
      \ 'as': 'ycm',
      \ 'do': 'git submodule update --init --recursive && ./install.py --clang-completer --system-libclang --js-completer',
      \ 'for': ['c', 'cpp', 'python', 'javascript', 'objc', 'objcpp'],
    \ }
                                              " 超难搞的YouuCompleteMe
  Plug 'spf13/vim-colors'
  " Plug 'junegunn/fzf.vim'
  " Plug 'junegunn/fzf',
  "   \ {
  "     \ 'dir': '~/.vim/bin',
  "     \ 'do': './install --all',
  "   \ }
  Plug 'Yggdroot/LeaderF',
    \ {
      \ 'do': './install.sh'
    \ }
  Plug 'junegunn/vim-plug'
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'yianwillis/vimcdoc'

  Plug 'syngan/vim-vimlint',
    \ {
      \ 'for': ['vim'],
    \ }
  Plug 'tpope/vim-surround'
  Plug 'octol/vim-cpp-enhanced-highlight'
  " ==============================================================================

  call plugin#end()

endfunction
