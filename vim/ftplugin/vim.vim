" let b:ale_linters = ['vint']
" let b:ale_fixers = []
" runtime local/ale.vim

augroup df_vim
  autocmd! * <buffer>
  autocmd FileType vim set foldmethod=expr foldlevel=0
  autocmd FileType vim set foldexpr=VimFolds(v:lnum)
augroup END

runtime local/coc.vim

function! VimFolds(lnum)
  let s:cur_line = getline(a:lnum)
  if s:cur_line =~ '^""'
    return '>' . (matchend(s:cur_line, '^"*')-1)
  else
    return '='
  endif
endfunction

