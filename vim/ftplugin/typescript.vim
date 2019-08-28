" let b:ale_linters = ['tsserver', 'eslint']
" let b:ale_fixers = ['prettier', 'eslint']

" " Generic ALE bindings - should be extracted to separate file
" " LOCAL LEADER
" map <silent> <localleader><localleader> :ALEHover<CR>
" map <silent> <localleader>= <Plug>(ale_fix)
" map <silent> <localleader>? <Plug>(ale_documentation)
" map <silent> <localleader>XX :ALEStopAllLSPs<CR>
"
" " ERRORS
" let g:which_key_local_map.e = {'name': '+errors'}
" map <localleader>el :lopen<CR>
" map <localleader>ee <Plug>(ale_next_wrap)
" map <localleader>eE <Plug>(ale_previous_wrap)
" map <localleader>ed :lclose<CR>
"
" " GOTO
" let g:which_key_local_map.g = {'name': '+goto'}
" map <localleader>gg <Plug>(ale_go_to_definition)
" map <localleader>gt <Plug>(ale_go_to_type_definition)
" map <localleader>gr <Plug>(ale_find_references)
"


" Generic COC bindings
" LOCAL LEADER
map <silent> <localleader><localleader> :call CocAction('doHover')<CR>
map <silent> <localleader>= <Plug>(coc-codeaction)

" ERRORS
let g:which_key_local_map.e = {'name': '+errors'}
map <localleader>ee :<C-u>CocList --auto-preview diagnostics<CR>
map <localleader>e; :<C-u>CocListResume<CR>
map <localleader>eN <Plug>(coc-diagnostic-prev)
map <localleader>ep <Plug>(coc-diagnostic-prev)
map <localleader>en <Plug>(coc-diagnostic-next)
map <localleader>eq :lclose<CR>

" GOTO
let g:which_key_local_map.g = {'name': '+goto'}
map <silent> <localleader>gg <Plug>(coc-definition)
map <silent> <localleader>gi <Plug>(coc-implementation)
map <silent> <localleader>gt <Plug>(coc-type-definition)
map <silent> <localleader>gr <Plug>(coc-references)

map <silent> <localleader>o :<C-u>CocList outline<CR>
map <silent> <localleader>s :<C-u>CocList -I symbols<CR>

" COC - Meta
map <silent> <localleader>cC :<C-u>CocConfig<CR>
map <silent> <localleader>cr :<C-u>CocRebuild<CR>
map <silent> <localleader>cq :<C-u>CocRestart<CR>
map <silent> <localleader>cc :<C-u>CocList commands<CR>
map <silent> <localleader>ce :<C-u>CocList extensions<CR>


" " Generic LanguageClient bindings
" " LOCAL LEADER
" map <silent> <localleader><localleader> :call LanguageClient#textDocument_hover()<CR>
" map <silent> <localleader>= :call LanguageClient#textDocument_codeAction()<CR>
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
" map <silent> <localleader>gg :call LanguageClient#textDocument_definition()<CR>
" map <silent> <localleader>gi <Plug>(coc-implementation)
" map <silent> <localleader>gt :call LanguageClient#textDocument_typeDefinition()<CR>
" map <silent> <localleader>gr :call LanguageClient#textDocument_references()<CR>
"
" map <silent> <localleader>o :<C-u>CocList outline<CR>
" map <silent> <localleader>s :<C-u>CocList -I symbols<CR>
"
" " REFACTOR
" map <silent> <localleader>rr :call LanguageClient#textDocument_rename()<CR>



augroup df_typescript
    autocmd!
    " autocmd CursorHold * silent call CocActionAsync('highlight')
    " Update signature help on jump placeholder
    " autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    " au! CursorHold * :ALEHover " https://github.com/dense-analysis/ale/issues/1532
    autocmd BufWritePre <buffer> CocCommand prettier.formatFile
augroup END
