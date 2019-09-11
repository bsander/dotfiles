augroup df_typescript
  autocmd! * <buffer>
  " autocmd CursorHold * :ALEHover " https://github.com/dense-analysis/ale/issues/1532

  " autocmd CursorHold * silent call CocActionAsync('highlight')
  " autocmd FileWritePre,BufWritePre <buffer> CocCommand prettier.formatFile
  " autocmd FileWritePre,BufWritePre * CocCommand prettier.formatFile
augroup END

" let b:ale_linters = ['tsserver', 'eslint']
let b:ale_linters = ['eslint']
let b:ale_fixers = ['eslint', 'prettier']

runtime local/ale.vim
runtime local/lsp.vim

" " Generic COC bindings
" " LOCAL LEADER
" map <silent> <localleader><localleader> :call CocAction('doHover')<CR>
" map <silent> <localleader>= <Plug>(coc-codeaction)
"
" " ERRORS
" let g:which_key_local_map.e = {'name': '+errors'}
" map <localleader>ee :<C-u>CocList --auto-preview diagnostics<CR>
" map <localleader>e; :<C-u>CocListResume<CR>
" map <localleader>eN <Plug>(coc-diagnostic-prev)
" map <localleader>ep <Plug>(coc-diagnostic-prev)
" map <localleader>en <Plug>(coc-diagnostic-next)
" map <localleader>eq :lclose<CR>
"
" " GOTO
" let g:which_key_local_map.g = {'name': '+goto'}
" map <silent> <localleader>gg <Plug>(coc-definition)
" map <silent> <localleader>gi <Plug>(coc-implementation)
" map <silent> <localleader>gt <Plug>(coc-type-definition)
" map <silent> <localleader>gr <Plug>(coc-references)
"
" " REFACTOR
" map <silent> <localleader>rr <Plug>(coc-rename)
" map <silent> <localleader>rx <Plug>(coc-codeaction)
"
" map <silent> <localleader>o :<C-u>CocList outline<CR>
" map <silent> <localleader>s :<C-u>CocList -I symbols<CR>
"
" " COC - Meta
" map <silent> <localleader>cC :<C-u>CocConfig<CR>
" map <silent> <localleader>cr :<C-u>CocRebuild<CR>
" map <silent> <localleader>cq :<C-u>CocRestart<CR>
" map <silent> <localleader>cc :<C-u>CocList commands<CR>
" map <silent> <localleader>ce :<C-u>CocList extensions<CR>


