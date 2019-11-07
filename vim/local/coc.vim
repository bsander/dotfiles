" Generic COC bindings

augroup df_coc
  autocmd! * <buffer>
  autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

" GENERIC
inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" LOCAL LEADER
map <silent> <localleader><localleader> :call CocAction('doHover')<CR>
map <silent> <localleader>f <Plug>(coc-codeaction)
map <silent> <localleader>d <Plug>(coc-diagnostic-info)

" ERRORS
let g:which_key_local_map.e = {'name': '+errors'}
map <silent> <localleader>ee :<C-u>CocList --auto-preview diagnostics<CR>
map <silent> <localleader>e; :<C-u>CocListResume<CR>
map <silent> <localleader>eN <Plug>(coc-diagnostic-prev)
map <silent> <localleader>ep <Plug>(coc-diagnostic-prev)
map <silent> <localleader>en <Plug>(coc-diagnostic-next)
map <silent> <localleader>eq :lclose<CR>

" GOTO
let g:which_key_local_map.g = {'name': '+goto'}
map <silent> <localleader>gg <Plug>(coc-definition)
map <silent> <localleader>gi <Plug>(coc-implementation)
map <silent> <localleader>gt <Plug>(coc-type-definition)
map <silent> <localleader>gs :CocList --auto-preview outline<CR>
map <silent> <localleader>gr <Plug>(coc-references)

" REFACTOR
let g:which_key_local_map.r = {'name': '+refactor'}
map <silent> <localleader>rr <Plug>(coc-rename)
map <silent> <localleader>rx <Plug>(coc-codeaction)

" SEARCH
let g:which_key_local_map.s = {'name': '+search'}
map <silent> <localleader>ss :<C-u>CocList --auto-preview --interactive symbols<CR>

" META
let g:which_key_local_map.x = {'name': '+meta'}
map <silent> <localleader>xi :<C-u>CocInfo<CR>
map <silent> <localleader>xx :<C-u>CocRestart<CR>

" COC - Meta
let g:which_key_local_map.c = {'name': '+coc'}
map <silent> <localleader>cc :<C-u>CocConfig<CR>
map <silent> <localleader>cf :<C-u>CocRebuild<CR>
map <silent> <localleader>cx :<C-u>CocRestart<CR>
map <silent> <localleader>cr :<C-u>CocList commands<CR>
map <silent> <localleader>ce :<C-u>CocList extensions<CR>
