augroup df_gitcommit
  autocmd! * <buffer>
  noremap <silent> <localleader><localleader> :w \| bd \| startinsert<CR>
  noremap <silent> <localleader>x gg"gdG:w \| bd \| startinsert<CR>
  " " Always open in insert mode
  " autocmd BufEnter <buffer> startinsert!
augroup END
