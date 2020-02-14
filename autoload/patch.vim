" tmux will send xterm-style keys when its xterm-keys option is on

function! patch#tmux() abort
  if &term =~ '^screen'
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
  endif
endfunction

function! patch#meta() abort
  if &term != 'builtin_gui'
    let l:ch = 'a'
    while l:ch <= 'z'
      execute "set <A-".l:ch.">=\e".l:ch
      execute "imap \e".l:ch." <A-".l:ch.">"
      let l:ch = nr2char(1 + char2nr(l:ch))
    endwhile
  endif
  set timeout ttimeoutlen=50
endfunction
