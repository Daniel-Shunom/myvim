" nerd.vim - NERDTree auto-refresh setup
autocmd BufEnter NERD_tree_* execute 'normal! R'
autocmd CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif

augroup DIRCHANGE
  autocmd!
  autocmd DirChanged * NERDTreeCWD
augroup END

