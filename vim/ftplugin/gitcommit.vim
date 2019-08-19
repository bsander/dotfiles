augroup df_gitcommit
    autocmd!
    noremap <silent> <localleader><localleader> :w \| bd \| startinsert<CR>
    noremap <silent> <localleader>x gg"gdG:w \| bd \| startinsert<CR>
augroup END
