" Generic ALE bindings

" INSERT MODE
" imap <buffer> <silent> <C-Space> <Plug>(ale_complete)

" LOCAL LEADER
map <buffer> <silent> <localleader><localleader> <Plug>(ale_hover)
map <buffer> <silent> <localleader>= <Plug>(ale_fix)
map <buffer> <silent> <localleader>? <Plug>(ale_documentation)

" ERRORS
let g:which_key_local_map.e = {'name': '+errors'}
" map <buffer> <silent> <localleader>el :call ToggleLocationList()<CR>
" map <buffer> <silent> <localleader>ea :call ToggleQuickfixList()<CR>
map <buffer> <silent> <localleader>ee <Plug>(ale_detail)
map <buffer> <silent> <localleader>en <Plug>(ale_next_wrap)
map <buffer> <silent> <localleader>eN <Plug>(ale_previous_wrap)
map <buffer> <silent> <localleader>ep <Plug>(ale_previous_wrap)

" " SEARCH
" map <buffer> <silent> <localleader>ss :ALESymbolSearch<CR>

" GOTO
let g:which_key_local_map.g = {'name': '+goto'}
map <buffer> <silent> <localleader>gg <Plug>(ale_go_to_definition)
map <buffer> <silent> <localleader>gt <Plug>(ale_go_to_type_definition)
map <buffer> <silent> <localleader>gr <Plug>(ale_find_references)

" META
map <buffer> <silent> <localleader>xx :ALEStopAllLSPs<CR>
map <buffer> <silent> <localleader>xi :Bufferize ALEInfo<CR>
map <buffer> <silent> <localleader>xl <Plug>(ale_lint)
map <buffer> <silent> <localleader>xt <Plug>(ale_toggle_buffer)

