let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow'
let $FZF_DEFAULT_OPTS = '--cycle --reverse --exact --inline-info --no-sort --tiebreak=begin,length,index'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" " https://github.com/junegunn/fzf/issues/1393#issuecomment-426576577
" autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

" Terminal buffer options for fzf
" autocmd! FileType fzf
" autocmd  FileType fzf set noshowmode noruler nonu


function! s:copy_results(lines)
  let joined_lines = join(a:lines, "\n")
  if len(a:lines) > 1
    let joined_lines .= "\n"
  endif
  let @+ = joined_lines
endfunction

let g:fzf_buffers_jump = 1
let g:fzf_commands_expect = 'ctrl-x'
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_action = {
      \ 'ctrl-e': 'edit',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit',
      \ 'ctrl-y': function('s:copy_results')
      \ }

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
      \ 'header':  ['fg', 'WildMenu']
      \ }

" Filter through yanks
function! s:yank_list()
  redir => ys
  silent registers
  redir END
  return split(ys, '\n')[1:]
endfunction

function! s:paste_handler(reg)
  if empty(a:reg)
    echo "aborted register paste"
  else
    let token = split(a:reg, ' ')[0]
    execute 'normal! ' . token . "p"
  endif
endfunction

function! s:yank_handler(reg)
  if empty(a:reg)
    echo "aborted register yank"
  else
    let token = split(a:reg, ' ')[0]
    execute 'let @0=@' . token[1:]
  endif
endfunction

command! FZFDirs call fzf#run(fzf#wrap({
      \ 'source': 'fd --hidden --type d . "$HOME/src"',
      \ 'options': ['--preview', 'exa --tree --level=2 --group-directories-first --git-ignore --colour=always {}']
      \ }))

command! FZFYank call fzf#run(fzf#wrap({
      \ 'source': <sid>yank_list(),
      \ 'sink': function('<sid>yank_handler'),
      \ }))

command! FZFPaste call fzf#run(fzf#wrap({
      \ 'source': <sid>yank_list(),
      \ 'sink': function('<sid>paste_handler'),
      \ }))
