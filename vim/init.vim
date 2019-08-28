scriptencoding utf-8

" TODO LIST
" - :cdo :cfdo - interactive global search replace (qfreplace plugin)
" - iab
" - vimdiff
" - split up init.vim - combine plug with config
" - leader group undo (C-h u)
" - tig - rebase and un/stage keybindings
" - customize easymotion setup
" - proper debugging support
" - macros
" - tabs buffers mayhem
" - get rid of unimpaired

" FIXME - broken
" - open gitcommit filetype in insert mode
" - fzf - empty list on no input
" - NERDCommenterInsert adds extra newline
" - fzf extra commands not working https://github.com/junegunn/fzf.vim/issues/18
" - fzf with ripgrep - go to column

" !! GRIPES
" - empty line unindenting: use S -- https://vi.stackexchange.com/questions/3612/how-do-i-prevent-vim-from-unindenting-empty-lines

let g:mapleader=' '
let g:maplocalleader = ','

call plug#begin('~/.vim/vendor')

"" Preamble
Plug 'tpope/vim-sensible'
Plug 'liuchengxu/vim-better-default'
let g:vim_better_default_key_mapping = 1
let g:vim_better_default_enable_folding = 0
let g:vim_better_default_persistent_undo = 0
let g:vim_better_default_basic_key_mapping = 0
let g:vim_better_default_buffer_key_mapping = 0
let g:vim_better_default_file_key_mapping = 0
let g:vim_better_default_fold_key_mapping = 0
let g:vim_better_default_window_key_mapping = 0

"" Text Manipulation
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
let g:fzf_buffers_jump = 1
let g:fzf_commands_expect = 'alt-enter'
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_action = {
      \ 'ctrl-e': 'edit',
      \ 'ctrl-x': 'Bdelete',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }
let g:fzf_colors = {
      \ "fg":      ["fg", "Normal"],
      \ "bg":      ["bg", "Normal"],
      \ "hl":      ["fg", "IncSearch"],
      \ "fg+":     ["fg", "CursorLine", "CursorColumn", "Normal"],
      \ "bg+":     ["bg", "CursorLine", "CursorColumn"],
      \ "hl+":     ["fg", "IncSearch"],
      \ "info":    ["fg", "IncSearch"],
      \ "border":  ["fg", "Ignore"],
      \ "prompt":  ["fg", "Comment"],
      \ "pointer": ["fg", "IncSearch"],
      \ "marker":  ["fg", "IncSearch"],
      \ "spinner": ["fg", "IncSearch"],
      \ "header":  ["fg", "WildMenu"] }




Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-line' | Plug 'glts/vim-textobj-comment' | Plug 'kana/vim-textobj-entire'
Plug 'tpope/vim-unimpaired' " Would like to replace with custom setup
Plug 'terryma/vim-multiple-cursors' " https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db

Plug 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
let g:EasyMotion_keys = 'fghjdkrtyucvbnsla;ewqiopzxm'

Plug 'tpope/vim-surround'
Plug 'terryma/vim-expand-region'
let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'il'  :0,
      \ 'ip'  :0,
      \ 'ie'  :0,
      \ }

Plug 'scrooloose/nerdcommenter'
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDCompactSexyComs = 0
let g:NERDDefaultAlign = 'left'

Plug 'tommcdo/vim-exchange'
Plug 'jiangmiao/auto-pairs'
Plug 'tyru/open-browser.vim'
let g:openbrowser_default_search = 'startpage'
let g:openbrowser_search_engines = {
      \   'startpage': 'https://www.startpage.com/do/dsearch?query={query}&cat=web',
      \}

"" Languages

" let g:polyglot_disabled = ['typescript']
" Plug 'sheerun/vim-polyglot'

Plug 'herringtondarkholme/yats.vim'
Plug 'editorconfig/editorconfig-vim'

Plug 'jparise/vim-graphql'
Plug 'bfontaine/Brewfile.vim'

" Colors
Plug 'morhetz/gruvbox'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = 0

" Plug 'NewProggie/NewProggie-Color-Scheme'

"" Finalize colors
set background=dark " Let vim know about our colors


"" UI / Syntax
Plug 'andrewradev/bufferize.vim'
let g:bufferize_command = 'enew'

Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

Plug 'airblade/vim-gitgutter'
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

Plug 'ryanoasis/vim-devicons'

"" Tools
Plug 'liuchengxu/vim-which-key'

" Plug 'rbgrouleff/bclose.vim' | Plug 'iberianpig/tig-explorer.vim'
Plug 'rbgrouleff/bclose.vim' | Plug '~/src/forks/tig-explorer.vim'
let g:bclose_no_plugin_maps = 1

Plug 'tpope/vim-fugitive'
Plug 'DataWraith/auto_mkdir'
Plug 'airblade/vim-matchquote'
Plug 'dbakker/vim-projectroot'

"" Experimental
Plug 'junegunn/vim-peekaboo' " See contents of registers
let g:peekaboo_window = 'bo 30new'
let g:peekaboo_compact = 1
let g:peekaboo_delay = 300

Plug 'Olical/vim-enmasse' " Edit every line in a quickfix list at the same time
" Plug 'thinca/vim-qfreplace'

Plug 'simnalamburt/vim-mundo' " Vim undo tree visualizer
let g:mundo_right = 1
let g:mundo_width = 60

" Plug 'mbbill/undotree'
" let g:undotree_WindowLayout = 4
" let g:undotree_ShortIndicators = 1
" let g:undotree_SetFocusWhenToggle = 1


"" File management plugins
Plug 'scrooloose/nerdtree' " A tree explorer plugin for vim.
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
" Plug 'tpope/vim-vinegar'

" Plug 'justinmk/vim-dirvish'
" let g:dirvish_mode = ':sort ,^.*[\/],'

" Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'whiteinge/diffconflicts'

" Error reporting
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

" Plug 'w0rp/ale'
" let g:ale_linters_explicit = 1 " Only run linters named in ale_linters settings.
" let g:ale_fix_on_save = 1
" let g:ale_linters = {
"       \   '*': ['remove_trailing_lines', 'trim_whitespace'],
"       \   'vim': ['vint'],
"       \ }
"
" Plug 'autozimu/LanguageClient-neovim', {
"       \ 'branch': 'next',
"       \ 'do': 'bash install.sh',
"       \ }
" let g:LanguageClient_hoverPreview = "Never"
" let g:LanguageClient_rootMarkers = {
"       \ 'typescript': ['.git', 'tsconfig.json'],
"       \ }
" let g:LanguageClient_serverCommands = {
"       \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"       \ 'typescript': ['/usr/local/bin/typescript-language-server', '--stdio'],
"       \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"       \ }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ ]

Plug 'moll/vim-bbye'

call plug#end()

runtime! plugin/default.vim
set termguicolors " make terminal colors vork in vimr
set autoread " Auto-refresh unchanged files when content changes
set norelativenumber
set nonumber
set signcolumn=yes
set timeoutlen=800
set updatetime=300
set formatoptions-=cro " https://superuser.com/a/271024
set clipboard=
set noshowmode
set cmdheight=2
set shortmess+=c

colorscheme gruvbox
call expand_region#custom_text_objects({
      \ "\/\\n\\n\<CR>": 1,
      \ 'a]' :1,
      \ 'ab' :1,
      \ 'aB' :1,
      \ })

call deoplete#custom#option('sources', {
      \  '_': ['ale'],
      \ })

" Deoplete
call deoplete#custom#option({
      \   'auto_complete_delay': 150,
      \   'auto_refresh_delay': 150,
      \   'smart_case': v:true,
      \ })

" KEYBINDINGS
" System clipboard integration
map gy "+y
map gY "+Y
map gc "+c
map gC "+C
map gd "+d
map gD "+D
map gp "+p
map gP "+P
" Redo
noremap <silent> U <C-r>
" Clear search highlight on escape
nnoremap <silent> <esc> :noh<CR><esc>
" God damn macros (move to <Leader>xq)
noremap <silent> q <Nop>
noremap <silent> Q <Nop>
" Move line or selection
nnoremap <silent> J :m+1<CR>
nnoremap <silent> K :m-2<CR>
vmap <silent> J :'<'>,m'>+1<CR>:normal gv<CR>
vmap <silent> K :'<'>,m'<-2<CR>:normal gv<CR>
" Join lines
noremap <silent> H k:join!<CR>
noremap <silent> L :join!<CR>
" Yank to the end of line
nnoremap <silent> Y y$
" Quit visual mode
vnoremap <silent> v <Esc>
" Moving around in insert/command modes
inoremap <silent> <C-h> <Left>
inoremap <silent> <C-j> <Down>
inoremap <silent> <C-k> <Up>
inoremap <silent> <C-l> <Right>
inoremap <silent> <C-a> <Home>
inoremap <silent> <C-e> <End>
inoremap <silent> <C-d> <Delete>
cnoremap <silent> <C-h> <Left>
cnoremap <silent> <C-j> <Down>
cnoremap <silent> <C-k> <Up>
cnoremap <silent> <C-l> <Right>
cnoremap <silent> <C-a> <Home>
cnoremap <silent> <C-e> <End>
cnoremap <silent> <C-d> <Delete>
" jj | Escaping insert/command mode
inoremap <silent> jj <Esc>
cnoremap <silent> jj <C-c>
" Cycle deoplete suggestions on tab
inoremap <silent> <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" Exit terminal insert mode
tnoremap <silent> <C-'><C-'> <C-\><C-n>
tnoremap <silent> QQ <C-\><C-n>
" " Comment current line in insert mode
" imap <C-/> <Plug>NERDCommenterInsert
let g:netrw_nogx = 1 " disable netrw's gx mapping.
map gx <Plug>(openbrowser-smart-search)
" Fast swap
map cx <Plug>(Exchange)
map cX <Plug>(ExchangeClear)
" Show completions
" inoremap <silent><expr> <c-space> coc#refresh()

" WHICH_KEY
let g:which_key_map =  {}

" LEADER LEADER
noremap <silent> <Leader><Space> :Commands<CR>
nnoremap <silent> <Leader><ESC> <ESC>
map <Leader>/ :BLines<CR>
map <Leader>? :ProjectRootExe Rg<CR>
nnoremap <silent> <Leader><Tab> :bnext<CR>
nnoremap <silent> <Leader><S-Tab> :bprev<CR>
noremap <silent> <Leader>' :split term://$SHELL<CR>
let g:which_key_map['/'] = 'Search project'

" BUFFER
let g:which_key_map.b = { 'name' : '+buffer' }
nnoremap <silent> <Leader>bo :%bd\|e#\|bd#<CR>
let g:which_key_map.b.O = 'only'
nnoremap <silent> <Leader>bO :%bd!\|e#\|bd#<CR>
let g:which_key_map.b.O = 'only!'
nnoremap <silent> <Leader>bb :Buffers<CR>
nnoremap <silent> <Leader>bp :bprevious<CR>
nnoremap <silent> <Leader>bN :bprevious<CR>
nnoremap <silent> <Leader>bn :bnext<CR>
nnoremap <silent> <Leader>bx :Bdelete<CR>
nnoremap <silent> <Leader>bX :Bdelete!<CR>
nnoremap <silent> <Leader>bd :Bclose<CR>
nnoremap <silent> <Leader>bD :Bclose!<CR>
nnoremap <silent> <Leader>bm :Bufferize messages<CR>
nnoremap <silent> <Leader>br :edit<CR>
nnoremap <silent> <Leader>bR :edit!<CR>
nnoremap <silent> <Leader>bY yie
nnoremap <silent> <Leader>bP "_dieP

" COMMENT (NERDCommenter)
let g:which_key_map.c = { 'name' : '+comment' }
map <Leader>cc <Plug>NERDCommenterToggle
map <Leader>ci <Plug>NERDCommenterComment
map <Leader>cm <Plug>NERDCommenterSexy
map <Leader>cy <Plug>NERDCommenterYank
nmap <Leader>cd :call NERDComment(1, 'yank') \| normal p<CR>
vmap <Leader>cd :call NERDComment(1, 'yank') \| '>normal p<CR>
map <Leader>ca <Plug>NERDCommenterAppend
" nmap <Leader>co o<Esc><Plug>NERDCommenterAppend
nmap <Leader>co o<ESC><Plug>NERDCommenterComment==:startinsert!<CR><Space>
nmap <Leader>cO O<ESC><Plug>NERDCommenterComment==:startinsert!<CR><Space>

" FILE
let g:which_key_map.f = { 'name' : '+file' }
nnoremap <silent> <Leader>fs :write<CR>
nnoremap <silent> <Leader>fa :wall<CR>
nnoremap <expr> <Leader>fS ':write ' . expand('%:p')
nnoremap <expr> <Leader>fo ':e ' . expand('%:p:h') . '/'
nnoremap <silent> <Leader>ff :ProjectRootExe Files<CR>
nnoremap <silent> <Leader>fD :call delete(expand('%')) \| bdelete!<CR>
nnoremap <silent> <Leader>fn :enew<CR>
nnoremap <silent> <Leader>fr :History<CR>
nnoremap <silent> <Leader>ft :NERDTreeToggle<CR>
nnoremap <silent> <Leader>fT :NERDTreeFind %<CR>

" INIT.VIM
let g:which_key_map.v = { 'name' : '+vimrc' }
nnoremap <silent> <Leader>ve :edit $MYVIMRC<CR>
nnoremap <silent> <Leader>vs :write \| source $MYVIMRC<CR>
nnoremap <silent> <Leader>vi :PlugInstall<CR>
nnoremap <silent> <Leader>vu :PlugUpdate<CR>
nnoremap <silent> <Leader>vc :PlugClean<CR>

" GIT
let g:which_key_map.g = { 'name': '+git' }
" map <Leader>gg :split +Tig\ status<CR>
map <Leader>gg :Tig status<CR>
" map <Leader>gf :Git fs<Space>
map <Leader>gl :Tig<CR>
" map <Leader>gb :Tig refs<CR>
map <Leader>gb :Gblame<CR>
" map <Leader>gg :Git<CR>
" map <Leader>gl :Glog!<CR>
" map <Leader>gm :Merginal<CR>
map <Leader>gs :terminal git sync<CR>

" HELP
let g:which_key_map.h = { 'name': '+help' }
map <Leader>hh :Helptags<CR>
map <Leader>hb :Maps<CR>

" JUMP (EasyMotion)
let g:which_key_map.j = { 'name': '+jump' }
map <Leader>j <Plug>(easymotion-bd-f2)
map <Leader>l <Plug>(easymotion-bd-jk)
" map  <Leader>jw <Plug>(easymotion-bd-w)

" QUIT
let g:which_key_map.q = { 'name' : '+quit' }
nnoremap <silent> <Leader>qq :confirm qall<CR>
nnoremap <silent> <Leader>qs :wqall<CR>
nnoremap <silent> <Leader>qQ :qall!<CR>

" SEARCH
let g:which_key_map.s = { 'name': '+search' }
nnoremap <silent> <Leader>ss :BLines<CR>
nnoremap <silent> <Leader>sb :Lines<CR>
nnoremap <silent> <Leader>sf :ProjectRootExe Rg<CR>

" TOGGLES
let g:which_key_map.t = { 'name': '+toggle' }
nnoremap <silent> <Leader>tc :Colors<CR>
nnoremap <silent> <Leader>tl :set invlist<CR>
nnoremap <silent> <Leader>tn :set invnumber<CR>
nnoremap <silent> <Leader>tN :set invrelativenumber<CR>
nnoremap <silent> <Leader>ts :Filetypes<CR>
nnoremap <silent> <Leader>t- :let &scrolloff=999-&scrolloff<CR>

" WINDOW (stolen from ...)
let g:which_key_map.w = {'name': '+window' }
nnoremap <silent> <Leader>wr <C-W>r
let g:which_key_map.w.r = 'rotate'
nnoremap <silent> <Leader>wd <C-W>c
let g:which_key_map.w.d = 'close'
nnoremap <silent> <Leader>wo <C-W>o
let g:which_key_map.w.o = 'only'
nnoremap <silent> <Leader>w= <C-W>=
let g:which_key_map.w['='] = 'equalize'

nnoremap <silent> <Leader>wt :tabedit<CR>
nnoremap <silent> <Leader>w. :tabnext<CR>
let g:which_key_map.w['.'] = '[>] tab'
nnoremap <silent> <Leader>w, :tabprev<CR>
let g:which_key_map.w[','] = '[<] tab'

nnoremap <silent> <Leader>ww <C-W>w
let g:which_key_map.w.w = '[O] focus'
nnoremap <silent> <Leader>wj <C-W>j
let g:which_key_map.w.j = '[v] focus'
nnoremap <silent> <Leader>wk <C-W>k
let g:which_key_map.w.k = '[^] focus'
nnoremap <silent> <Leader>wh <C-W>h
let g:which_key_map.w.h = '[<] focus'
nnoremap <silent> <Leader>wl <C-W>l
let g:which_key_map.w.l = '[>] focus'
" double-map
if has('nvim') || has('terminal')
  tnoremap <silent> <Leader>wj <C-W>j
  tnoremap <silent> <Leader>wk <C-W>k
  tnoremap <silent> <Leader>wh <C-W>h
  tnoremap <silent> <Leader>wl <C-W>l
endif

nnoremap <silent> <Leader>wJ <C-W>J
let g:which_key_map.w.J = '[v] move'
nnoremap <silent> <Leader>wK <C-W>K
let g:which_key_map.w.K = '[^] move'
nnoremap <silent> <Leader>wH <C-W>H
let g:which_key_map.w.H = '[<] move'
nnoremap <silent> <Leader>wL <C-W>L
let g:which_key_map.w.L = '[>] move'

nnoremap <silent> <Leader>w[ <C-W>5<
let g:which_key_map.w['['] = '[<] resize'
nnoremap <silent> <Leader>w] <C-W>5>
let g:which_key_map.w[']'] = '[>] resize'
nnoremap <silent> <Leader>w{ :resize +5<CR>
let g:which_key_map.w['{'] = '[^] resize'
nnoremap <silent> <Leader>w} :resize -5<CR>
let g:which_key_map.w['}'] = '[v] resize'

nnoremap <silent> <Leader>ws <C-W>s
let g:which_key_map.w.s = '[-] split'
nnoremap <silent> <Leader>wv <C-W>v
let g:which_key_map.w.v = '[|] split'


" TRANSFORMATIONS
let g:which_key_map.x = {'name': '+transform' }
nnoremap <silent> <Leader>xd :t.<CR>
vnoremap <silent> <Leader>xd "ay'>"apgv
let g:which_key_map.x.d = 'duplicate'
map <Leader>xo gx
" noremap <Leader>xu :<C-u>UndotreeToggle<CR>
noremap <silent> <Leader>xu :MundoToggle<CR>
noremap <silent> <Leader>xq q
let g:which_key_map.x.q = 'macro'
noremap <silent> <Leader>x@ :r!date<CR>
" Swap stuff around
map <Leader>xx <Plug>(Exchange)
map <Leader>xX <Plug>(ExchangeClear)


" LOCAL LEADER
let g:which_key_local_map = {}

call which_key#register('<Space>', 'g:which_key_map')
call which_key#register(',', 'g:which_key_local_map')

nnoremap <silent> <Leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <Leader> :<c-u>WhichKeyVisual '<Space>'<CR>

nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual ','<CR>

nnoremap <silent> [ :<c-u>WhichKey '['<CR>
vnoremap <silent> [ :<c-u>WhichKeyVisual '['<CR>

nnoremap <silent> ] :<c-u>WhichKey ']'<CR>
vnoremap <silent> ] :<c-u>WhichKeyVisual ']'<CR>

" nnoremap <silent> g :<c-u>WhichKey  'g'<CR> " Kills gg
" nnoremap <silent> s :<c-u>WhichKey  's'<CR>


autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" autocmd! FileType term://*
autocmd  FileType term://* set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" " https://github.com/junegunn/fzf/issues/1393#issuecomment-426576577
" autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

function! <SID>AutoProjectRootCD()
  try
    if &filetype != 'help'
      ProjectRootCD
    endif
  catch
    " Silently ignore invalid buffers
  endtry
endfunction

autocmd BufEnter * call <SID>AutoProjectRootCD()

" Use interactive grep versions
" \   'rg --vimgrep --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', 'alt-/'),
      \   <bang>0)

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

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
        \        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|^/private/var/\\|.git/\\|NvimView\\|^term:'"),
        \ )
endfunction

" Go to last cursor position when reopening file
if has('autocmd')
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" Start terminal in insert-mode
" autocmd TermOpen * startinsert
autocmd BufWinEnter,WinEnter term://* startinsert


" Connect to running nvim instance to avoid nested nvims
if has('nvim')
  let $GIT_EDITOR = 'nvr --remote-wait --servername ' . v:servername
endif
