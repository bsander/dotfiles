let b:ale_linters = ['tsserver', 'eslint']
let b:ale_fixers = ['prettier', 'eslint']

" Generic ALE bindings - should be extracted to separate file
" LOCAL LEADER
map <silent> <localleader><localleader> :ALEHover<CR>
map <silent> <localleader>= <Plug>(ale_fix)
map <silent> <localleader>? <Plug>(ale_documentation)
map <silent> <localleader>XX :ALEStopAllLSPs<CR>

" ERRORS
let g:which_key_local_map.e = {'name': '+errors'}
map <localleader>el :lopen<CR>
map <localleader>ee <Plug>(ale_next_wrap)
map <localleader>eE <Plug>(ale_previous_wrap)
map <localleader>ed :lclose<CR>

" GOTO
let g:which_key_local_map.g = {'name': '+goto'}
map <localleader>gg <Plug>(ale_go_to_definition)
map <localleader>gt <Plug>(ale_go_to_type_definition)
map <localleader>gr <Plug>(ale_find_references)

augroup df_typescript
    autocmd!
    " au! CursorHold * :ALEHover " https://github.com/dense-analysis/ale/issues/1532
augroup END
