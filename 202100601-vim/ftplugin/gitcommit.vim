" augroup df_gitcommit
"   autocmd! * <buffer>
" augroup END

noremap <buffer> <silent> <localleader><localleader> :w \| bd<CR>
noremap <buffer> <silent> <localleader>x gg"gdG:w \| bd<CR>
