" Generic LanguageClient-neovim bindings
augroup df_lsp
 autocmd! * <buffer>
 " autocmd CursorHold * :call LanguageClient#textDocument_documentHighlight()<CR>
augroup END

" LOCAL LEADER
map <buffer> <silent> <localleader><localleader> :call LanguageClient#textDocument_hover()<CR>
map <buffer> <silent> <localleader>f :call LanguageClient#textDocument_codeAction()<CR>
map <buffer> <silent> <localleader>d :call LanguageClient#explainErrorAtPoint()<CR>

" ERRORS
" let g:which_key_local_map.e = {'name': '+errors'}
" map <buffer> <silent> <localleader>ee <Plug>(ale_detail)
" map <buffer> <silent> <localleader>en <Plug>(ale_next_wrap)
" map <buffer> <silent> <localleader>eN <Plug>(ale_previous_wrap)
" map <buffer> <silent> <localleader>ep <Plug>(ale_previous_wrap)

" SEARCH
map <buffer> <silent> <localleader>ss :call LanguageClient#workspace_symbol()<CR>

" GOTO
let g:which_key_local_map.g = {'name': '+goto'}
map <buffer> <silent> <localleader>gg :call LanguageClient#textDocument_definition()<CR>
map <buffer> <silent> <localleader>gi :call LanguageClient#textDocument_implementation() <CR>
map <buffer> <silent> <localleader>gt :call LanguageClient#textDocument_typeDefinition() <CR>
map <buffer> <silent> <localleader>gs :call LanguageClient#textDocument_documentSymbol() <CR>
map <buffer> <silent> <localleader>gr :call LanguageClient#textDocument_references() <CR>

" REFACTOR
let g:which_key_local_map.r = {'name': '+refactor'}
map <buffer> <silent> <localleader>rr :call LanguageClient#textDocument_rename() <CR>
map <buffer> <silent> <localleader>rc :call LanguageClient_contextMenu()<CR>


" META
let g:which_key_local_map.x = {'name': '+meta'}
map <buffer> <silent> <localleader>xx :LanguageClientStop<CR>:LanguageClientStart<CR>
map <buffer> <silent> <localleader>xi :Bufferize call LanguageClient#debugInfo()<CR>


let g:which_key_local_map.l = {'name': '+LanguageClient-neovim'}
map <buffer> <silent> <localleader>lm :call LanguageClient_contextMenu()<CR>
map <buffer> <silent> <localleader>li :Bufferize call LanguageClient#debugInfo()<CR>
