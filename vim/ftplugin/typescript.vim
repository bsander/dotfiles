augroup df_typescript
  autocmd! * <buffer>
  autocmd FileWritePre,BufWritePre <buffer> CocCommand prettier.formatFile
augroup END

" let b:ale_linters = ['eslint']
" let b:ale_fixers = ['eslint', 'prettier']

runtime local/coc.vim
" runtime local/ale.vim
" runtime local/lsp.vim

