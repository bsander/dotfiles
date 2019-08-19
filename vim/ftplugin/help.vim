augroup df_help
    autocmd!
  " close help window
  autocmd FileType help noremap <buffer> q :q<cr>
  " Jump to help tag with Enter
  noremap <CR> <C-]>
augroup END
