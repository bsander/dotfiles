scriptencoding utf-8

" Leader: <SPACE>
let g:mapleader=' '
let g:maplocalleader='\'

" [m]ove instead of [d]elete
nnoremap m d
xnoremap m d
nnoremap mm dd
nnoremap M D

" System clipboard integration
map gy "+y
map gyy "+yy
map gY "+Y
map gc "+c
map gcc "+cc
map gC "+C
map gm "+m
map gmm "+mm
map gp "+p
map gP "+P

function! s:vsCodeVisualCmd(cmd)
    normal! gv
    let visualmode = visualmode()
    if visualmode == "V"
        let startLine = line("v")
        let endLine = line(".")
        call VSCodeNotifyRange(a:cmd, startLine, endLine, 1)
    else
        let startPos = getpos("v")
        let endPos = getpos(".")
        call VSCodeNotifyRangePos(a:cmd, startPos[1], endPos[1], startPos[2], endPos[2], 1)
    endif
endfunction

" Redo
nnoremap <silent> U <C-r>
" Clear search highlight on escape
nnoremap <silent> <esc> :noh<CR><esc>

" Join lines
nnoremap H k:join<CR>
nnoremap L :join<CR>
" noremap K :call <SID>vsCodeVisualCmd('editor.action.moveLinesUpAction')<CR>
" nnoremap J :call VSCodeCall('editor.action.moveLinesDownAction')<CR>
" vnoremap J :call <SID>vsCodeVisualCmd('editor.action.moveLinesDownAction')

nmap gc  <Plug>VSCodeCommentary
xmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

nnoremap <silent> Y y$
" Quit visual mode
vnoremap <silent> v <Esc>
" Normalize replace
nnoremap <silent> R cl
vnoremap <silent> R c

map ? /<CR>
" Consistency in search direction
noremap n /<CR>
noremap N ?<CR>

"" Multiple Cursors
" https://github.com/asvetliakov/vscode-neovim/blob/master/vim/vscode-insert.vim
" xnoremap qa <Cmd>call <SID>vscodePrepareMultipleCursors(1, 1)<CR>
" xnoremap qi <Cmd>call <SID>vscodePrepareMultipleCursors(0, 1)<CR>
" xnoremap qA <Cmd>call <SID>vscodePrepareMultipleCursors(1, 0)<CR>
" xnoremap qI <Cmd>call <SID>vscodePrepareMultipleCursors(0, 0)<CR>

nnoremap <Leader> :call VSCodeCall('vspacecode.space')<CR>

" INIT.VIM
nnoremap <LocalLeader>e :edit $DOTFILES/vim/init-vscode.vim<CR>
nnoremap <LocalLeader>r :source $DOTFILES/vim/init-vscode.vim<CR>
nnoremap <LocalLeader>i :PlugInstall<CR>
nnoremap <LocalLeader>u :PlugUpdate<CR>
nnoremap <LocalLeader>c :PlugClean<CR>
