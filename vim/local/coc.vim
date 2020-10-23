" Generic COC bindings

augroup df_coc
  autocmd! * <buffer>
  " autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

" GENERIC
inoremap <silent><expr> <C-Space> coc#refresh()
" inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'
" let g:coc_snippet_next = '<C-j>'
" let g:coc_snippet_prev = '<C-k>'

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" SCROLL FLOATING WINDOWS
nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"

" LOCAL LEADER
" noremap <silent> <CR> :call CocAction('doHover')<CR>
map <silent> <localleader><localleader> :call CocAction('doHover')<CR>
map <silent> <localleader>f <Plug>(coc-codeaction)
map <silent> <localleader>d <Plug>(coc-diagnostic-info)
" map <silent> <localleader>h :call <SID>show_documentation()<CR>

" ERRORS
let g:which_key_local_map.e = {'name': '+errors'}
map <silent> <localleader>ee :<C-u>CocFzfList diagnostics<CR>
map <silent> <localleader>e; :<C-u>CocFzfListResume<CR>
map <silent> <localleader>eN <Plug>(coc-diagnostic-prev)
map <silent> <localleader>ep <Plug>(coc-diagnostic-prev)
map <silent> <localleader>en <Plug>(coc-diagnostic-next)
map <silent> <localleader>eq :lclose<CR>

" GOTO
let g:which_key_local_map.g = {'name': '+goto'}
map <silent> <localleader>gg <Plug>(coc-definition)
map <silent> <localleader>gi <Plug>(coc-implementation)
map <silent> <localleader>gt <Plug>(coc-type-definition)
map <silent> <localleader>gr <Plug>(coc-references)

" REFACTOR
let g:which_key_local_map.r = {'name': '+refactor'}
map <silent> <localleader>rr <Plug>(coc-rename)

" SEARCH
let g:which_key_local_map.s = {'name': '+search'}
map <silent> <localleader>sp :<C-u>CocFzfList symbols<CR>
map <silent> <localleader>sf :CocFzfList outline<CR>
map <silent> <localleader>ss :CocFzfList outline<CR>

" META
let g:which_key_local_map.x = {'name': '+meta'}
map <silent> <localleader>xi :<C-u>CocInfo<CR>
map <silent> <localleader>cc :<C-u>CocConfig<CR>
map <silent> <localleader>xx :<C-u>CocRestart<CR>

" LISTS
let g:which_key_local_map.c = {'name': '+coc'}
map <silent> <localleader>cc :<C-u>CocFzfList commands<CR>
map <silent> <localleader>ce :<C-u>CocFzfList extensions<CR>
map <silent> <localleader>cm :<C-u>CocFzfList marketplace<CR>
map <silent> <localleader>cl :<C-u>CocFzfList<CR>
map <silent> <localleader>c; :<C-u>CocFzfListResume<CR>
