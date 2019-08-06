let b:ale_linters = ['tsserver', 'eslint']
let b:ale_fixers = ['eslint']

" Generic ALE bindings - should be extracted to separate file

imap <C-Space> <Plug>(ale_complete)

noremap <silent> <localleader><localleader> :ALEHover<CR>
noremap <silent> <localleader><Leader> <Plug>(ale_fix)
noremap <silent> <localleader>? <Plug>(ale_documentation)
noremap <silent> <localleader>X :ALEStopAllLSPs<CR>

" ERRORS
let g:which_key_local_map.e = {'name': '+errors'}
noremap <localleader>el :lopen<CR>
noremap <localleader>ee <Plug>(ale_next_wrap)
noremap <localleader>eE <Plug>(ale_previous_wrap)
noremap <localleader>ed :lclose<CR>

" GOTO
let g:which_key_local_map.g = {'name': '+goto'}
noremap <localleader>gg <Plug>(ale_go_to_definition)
noremap <localleader>gt <Plug>(ale_go_to_type_definition)
noremap <localleader>gr <Plug>(ale_find_references)

augroup df_typescript
    autocmd!
    " au! CursorHold * :ALEHover " https://github.com/dense-analysis/ale/issues/1532
augroup END
