" Connect to running nvim instance to avoid nested nvims
if has('nvim')
  let $FZF_DEFAULT_OPTS = '--exact --cycle'
endif


" " https://github.com/junegunn/fzf/issues/1393#issuecomment-426576577
" autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

function! s:copy_results(lines)
  let joined_lines = join(a:lines, "\n")
  if len(a:lines) > 1
    let joined_lines .= "\n"
  endif
  let @+ = joined_lines
endfunction

let g:fzf_layout = { 'window': 'call FloatingFZF()' }
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

" Use interactive grep versions
" \   'rg --vimgrep --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>),
      \   1,
      \   fzf#vim#with_preview(),
      \   <bang>0)

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Filter oldfiles for History command
command! History call fzf#run(
      \ fzf#wrap({
      \ 'source':  s:filtered_recent_files(),
      \ 'sink':    'edit',
      \ 'options': '-m -x +s',
      \ 'down':    '40%' }
      \ ))

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

command! FZFYank call fzf#run(fzf#wrap({
      \ 'source': <sid>yank_list(),
      \ 'sink': function('<sid>yank_handler'),
      \ }))

command! FZFPaste call fzf#run(fzf#wrap({
      \ 'source': <sid>yank_list(),
      \ 'sink': function('<sid>paste_handler'),
      \ }))

" Filter oldfiles and include open buffers
function! s:filtered_recent_files()
  return extend(
        \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'),
        \ filter(copy(v:oldfiles),
        \        "v:val !~? 'fugitive:\\|NERD_tree\\|^/tmp/\\|^/private/var/\\|.git/\\|NvimView\\|^term:'"),
        \ )
endfunction

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  " call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(&lines * 0.4)
  let row = float2nr(&lines - height)

  let width = float2nr(&columns - 2)
  let col = float2nr(&columns - width)
  " let width = float2nr(&columns - (&columns * 2 / 10))
  " let col = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

  let win = nvim_open_win(buf, v:true, opts)
  call setwinvar(win, '&winhighlight', 'NormalFloat:TabLine')
endfunction
