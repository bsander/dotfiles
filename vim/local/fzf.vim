
" " https://github.com/junegunn/fzf/issues/1393#issuecomment-426576577
" autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:fzf_buffers_jump = 1
let g:fzf_commands_expect = 'alt-enter'
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_action = {
      \ 'ctrl-e': 'edit',
      \ 'ctrl-x': 'Bdelete',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'IncSearch'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'IncSearch'],
      \ 'info':    ['fg', 'IncSearch'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Comment'],
      \ 'pointer': ['fg', 'IncSearch'],
      \ 'marker':  ['fg', 'IncSearch'],
      \ 'spinner': ['fg', 'IncSearch'],
      \ 'header':  ['fg', 'WildMenu'] }

" Use interactive grep versions
" \   'rg --vimgrep --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', 'alt-/'),
      \   <bang>0)

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', 'alt-/'), <bang>0)

" Filter oldfiles for History command
command! History call fzf#run(fzf#wrap({
      \ 'source':  s:filtered_recent_files(),
      \ 'sink':    'edit',
      \ 'options': '-m -x +s',
      \ 'down':    '40%' }))

" Filter oldfiles and include open buffers
function! s:filtered_recent_files()
  return extend(
        \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'),
        \ filter(copy(v:oldfiles),
        \        "v:val !~? 'fugitive:\\|NERD_tree\\|^/tmp/\\|^/private/var/\\|.git/\\|NvimView\\|^term:'"),
        \ )
endfunction

