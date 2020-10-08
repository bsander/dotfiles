
" let $FZF_DEFAULT_OPTS = '--exact --cycle --border'
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow'
let $FZF_DEFAULT_OPTS = '--cycle --reverse --exact --inline-info --no-sort'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
" let g:fzf_preview_window = 'top:60%'

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

" function! FZFRg(command_fmt, query, preview, fullscreen)
"   let initial_command = printf(a:command_fmt, shellescape(a:query))
"   let reload_command = printf(a:command_fmt, '{q}')
"   let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
"   call fzf#vim#grep(initial_command, 1, a:preview ? fzf#vim#with_preview(spec) : spec, a:fullscreen)
" endfunction

" function! FZFFiles(command_fmt, query, preview, fullscreen)
"   let initial_command = printf(a:command_fmt, shellescape(a:query), shellescape(a:query))
"   let reload_command = printf(a:command_fmt, '{q}', '{q}')
"   let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
"   call fzf#vim#files(initial_command, 1, a:preview ? fzf#vim#with_preview(spec) : spec, a:fullscreen)
" endfunction

" command! -nargs=* -bang Rg call FZFRg(
"   \ 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true',
"   \ <q-args>,
"   \ <bang>0,
"   \ 0)

" command! -nargs=* -bang Files call FZFFiles(
"   \ 'rg --files --hidden --follow --color=always --smart-case -g "**/*%s*/**" -g "*%s*" -- . || true',
"   \ <q-args>,
"   \ <bang>0,
"   \ 0)

" command! -bang -nargs=? -complete=dir Files
"       \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" " Filter oldfiles for History command
" command! History call fzf#run(
"       \ fzf#wrap({
"       \ 'source':  s:filtered_recent_files(),
"       \ 'sink':    'edit',
"       \ 'options': '-m -x +s'
"       \ }))

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

" " Filter oldfiles and include open buffers
" function! s:filtered_recent_files()
"   return extend(
"         \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'),
"         \ filter(copy(v:oldfiles),
"         \        "v:val !~? 'fugitive:\\|NERD_tree\\|^/tmp/\\|^/private/var/\\|.git/\\|NvimView\\|^term:'"),
"         \ )
" endfunction
