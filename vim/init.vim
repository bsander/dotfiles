scriptencoding utf-8

"" TODO LIST
" - vimdiff
" - proper debugging support
" - macros
" - tabs buffers mayhem
" - get rid of unimpaired

"" FIXME - broken
" - NERDCommenterInsert adds extra newline
" - fzf extra commands not working https://github.com/junegunn/fzf.vim/issues/18

"" GRIPES
" - empty line unindenting: use S -- https://vi.stackexchange.com/questions/3612/how-do-i-prevent-vim-from-unindenting-empty-lines

"" INFO
" - https://vi.stackexchange.com/a/13456
" - https://vimways.org/2018/from-vimrc-to-vim/

"" Editor-specific settings
if exists('g:vv')
  VVset fontfamily=Dank\ Mono
  VVset fontsize=14
endif

" goneovim: ~/.goneovim/setting.toml

" Neovide
" let g:neovide_cursor_trail_length = 0

if exists('g:neovide')
  set guifont=Dank\ Mono:h16
  " set guifont=MonoLisa:h16
  " set guifont=Courier_new:h16
  let g:neovide_cursor_antialiasing=v:true
  set linespace=5
endif

if exists('g:fvim_loaded')
  set guifont=JuliaMono:h16
  " set guifont=Dank\ Mono:h16
  FVimCursorSmoothMove v:true
  FVimCursorSmoothBlink v:true
  FVimFontLigature v:true
  " FVimUIPopupMenu v:false
  " FVimCustomTitleBar v:true
endif

let g:mapleader=' '
let g:maplocalleader = ','

"" LOAD PLUGINS
call plug#begin('~/.vim/vendor')

"" Preamble
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-eunuch' " Helpers for UNIX
Plug 'liuchengxu/vim-better-default'
let g:vim_better_default_key_mapping = 1
let g:vim_better_default_enable_folding = 0
let g:vim_better_default_persistent_undo = 0
let g:vim_better_default_basic_key_mapping = 0
let g:vim_better_default_buffer_key_mapping = 0
let g:vim_better_default_file_key_mapping = 0
let g:vim_better_default_fold_key_mapping = 0
let g:vim_better_default_window_key_mapping = 0

"" Dependencies
Plug 'tpope/vim-repeat'

Plug 'junegunn/fzf', { 'do': './install --bin' }
  \| Plug 'junegunn/fzf.vim'
  \| Plug 'chengzeyi/fzf-preview.vim'
  \| Plug 'antoinemadec/coc-fzf'

runtime local/fzf.vim

Plug 'kana/vim-textobj-user'
  \ | Plug 'glts/vim-textobj-comment'
  " \ | Plug 'kana/vim-textobj-line'
  " \ | Plug 'rhysd/vim-textobj-anyblock'
  " \ | Plug 'kana/vim-textobj-entire'
  " \ | Plug 'beloglazov/vim-textobj-quotes'

Plug 'rhysd/clever-f.vim' " Extended f, F, t and T key mappings
Plug 't9md/vim-textmanip' " Move/Duplicate text intuitively
Plug 'tpope/vim-unimpaired' " Would like to replace with custom setup

" Plug 'takac/vim-hardtime' " Stop using hjkl
" let g:hardtime_default_on = 1
" let g:hardtime_showmsg = 1
" let g:hardtime_ignore_buffer_patterns = ["term://*"]
" let g:hardtime_ignore_quickfix = 1
" let g:hardtime_allow_different_key = 1
" let g:hardtime_maxcount = 5

" Instead, embrace jjjj kkkk
Plug 'rhysd/accelerated-jk'

" Plug 'terryma/vim-multiple-cursors' " https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db
Plug 'mg979/vim-visual-multi', {'branch': 'master'}


Plug 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 1
let g:EasyMotion_use_upper = 1
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_keys = 'jfkdls;aytnburmvie,cow.xpqz/5647382910gh' " gh last for combo keys

Plug 'chaoren/vim-wordmotion'
let g:wordmotion_mappings = {
      \ 'w' : '<C-W>',
      \ 'b' : '<C-B>',
      \ 'e' : '<C-E>',
      \ 'ge' : 'g<C-E>',
      \ 'aw' : 'a<C-W>',
      \ 'iw' : 'i<C-W>',
      \ '<C-R><C-W>' : '<C-R><M-w>'
      \ }
Plug 'tpope/vim-surround'

"" Smooth scrolling
Plug 'psliwka/vim-smoothie'

" Plug 'junegunn/rainbow_parentheses.vim'
" let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}'], ['<', '>']]

" Plug 'luochen1990/rainbow'
" let g:rainbow_active = 1

Plug 'scrooloose/nerdcommenter'
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDCompactSexyComs = 0
let g:NERDDefaultAlign = 'left'

Plug 'tommcdo/vim-exchange'
Plug 'tyru/open-browser.vim'
let g:openbrowser_default_search = 'startpage'
let g:openbrowser_search_engines = {
      \   'startpage': 'https://www.startpage.com/do/dsearch?query={query}&cat=web',
      \}

"" Languages
" Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
" Plug 'romgrk/nvim-treesitter-context' " Show code context

Plug 'liuchengxu/graphviz.vim'

Plug 'editorconfig/editorconfig-vim'
Plug 'bfontaine/Brewfile.vim'
Plug 'jparise/vim-graphql', { 'for': 'graphql' } " BREAKS TS

"" Colors
Plug 'sainnhe/gruvbox-material'
let g:gruvbox_material_palette = 'original'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_disable_italic_comment = 1
let g:gruvbox_material_enable_italic = 0
let g:gruvbox_material_cursor = 'orange'
let g:gruvbox_material_menu_selection_background = 'orange'
let g:gruvbox_material_diagnostic_line_highlight = 1
let g:gruvbox_material_current_word = 'bold'
let g:gruvbox_material_better_performance = 1

" Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'atelierbram/Base2Tone-vim'
Plug 'cideM/yui'
Plug 'rakr/vim-two-firewatch'

"" UI / Syntax
Plug 'rhysd/vim-gfm-syntax' " GitHub Flavored Markdown syntax highlight extension for Vim
Plug 'andrewradev/bufferize.vim'
let g:bufferize_command = 'enew'

Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_tab_count = 1

Plug 'airblade/vim-gitgutter'

Plug 'ryanoasis/vim-devicons' " Adds file type icons to Vim plugins

"" Tools
Plug 'liuchengxu/vim-which-key'
let g:which_key_use_floating_win = 1
let g:which_key_disable_default_offset = 1
let g:which_key_floating_opts = { 'row': '+1' }

" let g:which_key_timeout = 200

" Plug 'rbgrouleff/bclose.vim' | Plug 'iberianpig/tig-explorer.vim'
" Plug 'rbgrouleff/bclose.vim' | Plug '~/src/forks/tig-explorer.vim'
" let g:bclose_no_plugin_maps = 1
Plug 'codeindulgence/vim-tig'

Plug 'tpope/vim-fugitive' " A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-rhubarb' " GitHub extension for fugitive.vim
Plug 'DataWraith/auto_mkdir'
Plug 'airblade/vim-matchquote'
Plug 'dbakker/vim-projectroot'

"" Experimental
Plug 'junegunn/vim-peekaboo' " See contents of registers
let g:peekaboo_window = 'bo 30new'
let g:peekaboo_compact = 0
let g:peekaboo_delay = 0
let g:peekaboo_window="call CreateCenteredFloatingWindow()"

Plug 'svermeulen/vim-cutlass' " Plugin that adds a 'cut' operation separate from 'delete'

Plug 'Olical/vim-enmasse' " Edit every line in a quickfix list at the same time

" Plug 'nathanaelkane/vim-indent-guides' " Indent Guides is a plugin for visually displaying indent levels in Vim.

" Plug 'Yggdroot/indentLine'

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
Plug 'andrewradev/linediff.vim'


Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_disable_transparent_cursor = 1
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-rls',
      \ 'coc-vimlsp',
      \ 'coc-marketplace',
      \ 'coc-json',
      \ 'coc-diagnostic',
      \ ]

Plug 'moll/vim-bbye'

Plug 'alok/notational-fzf-vim'
let g:nv_search_paths = ['~/src/notes']
let g:nv_use_short_pathnames = 1
let g:nv_create_note_window = 'edit'

Plug 'milkypostman/vim-togglelist' " Functions to toggle the [Location List] and the [Quickfix List] windows.
let g:toggle_list_no_mappings = 1

" Plug 'vim-scripts/scrollfix'
" let g:scrollfix = 60 " Experiment with default on

Plug 'blueyed/vim-diminactive' " dim inactive windows
Plug 'vim-scripts/restore_view.vim' " automatically restore one file's cursor position and folding information after restart vim

call plug#end()

" Configure treesitter
lua require('vimrc-treesitter')

" Default environment settings
runtime! plugin/default.vim
set mouse=a
set termguicolors " make terminal colors vork in vimr
set autoread " Auto-refresh unchanged files when content changes
set norelativenumber
set nonumber
set signcolumn=yes
set timeoutlen=500
set ttimeoutlen=0
set updatetime=300
set formatoptions-=cro " https://superuser.com/a/271024
set completeopt=menuone,preview,noinsert,noselect
set clipboard=
set noshowmode
set shortmess+=c
set scrolloff=7
set linebreak
set noshowcmd
set undodir=~/.vim/undodir
set undofile
" set background=light
set viewoptions=cursor,folds,slash,unix
" colorscheme Base2Tone_MorningLight
colorscheme gruvbox-material
let $BAT_THEME = 'gruvbox-light'
" set winblend=10
" set foldenable
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
" set foldlevel=0
set foldlevelstart=99
" set cmdheight=2
" set nohlsearch

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
nnoremap <silent> U <C-r>
" Clear search highlight on escape
nnoremap <silent> <esc> :noh<CR><esc>
" God damn macros (move to <Leader>xq)
noremap <silent> q <Nop>
noremap <silent> Q <Nop>
" Move line or selection
map <silent> J <Plug>(textmanip-move-down)
map <silent> K <Plug>(textmanip-move-up)
" Join lines
noremap <silent> H k:join<CR>
noremap <silent> L :join<CR>
" Split lines
nmap <C-H> moi<CR><Esc>`o
nmap <C-L> i<CR><Esc>
" Yank to the end of line
nnoremap <silent> Y y$
" Quit visual mode
vnoremap <silent> v <Esc>
" Normalize replace
nnoremap <silent> R cl
vnoremap <silent> R c
" " move thru camelcase
" map <silent> <C-w> <Plug>CamelCaseMotion_w
" map <silent> <C-b> <Plug>CamelCaseMotion_b
" map <silent> <C-e> <Plug>CamelCaseMotion_e
" map <silent> g<C-e> <Plug>CamelCaseMotion_ge
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
" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <silent> <C-c> <ESC>
" " Use <TAB> to select the popup menu:
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
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
" Embrace the jjjj kkkk
nmap j <Plug>(accelerated_jk_gj_position)
nmap k <Plug>(accelerated_jk_gk_position)
" Incremental search w/ Easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map ? /<CR>

" Consistency in search direction
noremap n /<CR>
noremap N ?<CR>
" Use Tab for buffer navigation
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprev<CR>
" Experiment with some native motions
" map <silent> / <Plug>(easymotion-sn)
" [m]ove instead of [d]elete
nnoremap m d
xnoremap m d
nnoremap mm dd
nnoremap M D
 " Mouse wheel scrolling
" map <ScrollWheelUp> <C-Y>
" map <S-ScrollWheelUp> <C-U>
" map <ScrollWheelDown> <C-E>
" map <S-ScrollWheelDown> <C-D>

" WHICH_KEY
let g:which_key_map =  {}

" LEADER LEADER
noremap <silent> <Leader><Space> :Commands<CR>
nnoremap <silent> <Leader><ESC> <ESC>
noremap <silent> <Leader><Tab> :Buffers<CR>
nnoremap <silent> <Leader>; :FZFBLines<CR>
noremap <silent> <Leader>/ :ProjectRootExe FZFRg<CR>
noremap <silent> <Leader>' :split term://$SHELL<CR>
let g:which_key_map['/'] = 'Search project'

" APPLICATIONS
let g:which_key_map.a = { 'name' : '+apps' }
nnoremap <silent> <Leader>an :NV<CR>


" BUFFER
let g:which_key_map.b = { 'name' : '+buffer' }
nnoremap <silent> <Leader>bo :%bd\|e#\|bd#<CR>
let g:which_key_map.b.o = 'only'
nnoremap <silent> <Leader>bO :%bd!\|e#\|bd#<CR>
let g:which_key_map.b.O = 'only!'
nnoremap <silent> <Leader>bd :Bdelete<CR>
nnoremap <silent> <Leader>bD :Bdelete!<CR>
nnoremap <silent> <Leader>bm :Bufferize messages<CR>
nnoremap <silent> <Leader>br :edit<CR>
nnoremap <silent> <Leader>bR :edit!<CR>

" COMMENT (NERDCommenter)
let g:which_key_map.c = { 'name' : '+comment' }
map <Leader>cc <Plug>NERDCommenterToggle
map <Leader>ci <Plug>NERDCommenterComment
map <Leader>cm <Plug>NERDCommenterSexy
nmap <Leader>cd :call NERDComment(1, 'yank') \| normal p<CR>
vmap <Leader>cd :call NERDComment(1, 'yank') \| '>normal p<CR>
map <Leader>ca <Plug>NERDCommenterAppend
nmap <Leader>co o<ESC><Plug>NERDCommenterComment==:startinsert!<CR><Space>
nmap <Leader>cO O<ESC><Plug>NERDCommenterComment==:startinsert!<CR><Space>

" DIFF
let g:which_key_map.d = { 'name' : '+diff' }
noremap <silent> <Leader>dd :DiffConflicts<CR>:windo set modifiable<CR><C-W>t
noremap <silent> <Leader>dx <C-W>t<C-W>o:diffoff!<CR>
noremap <silent> <Leader>dg :diffget<CR>
noremap <silent> <Leader>dp :diffput<CR>
noremap <silent> <Leader>dn ]c
noremap <silent> <Leader>dN [c

" DEBUG
let g:which_key_map.D = { 'name' : '+debug' }
nnoremap <silent> <leader>DD :exe ":profile start profile.log"<CR>:exe ":profile func *"<CR>:exe ":profile file *"<CR>
nnoremap <silent> <leader>DP :exe ":profile pause"<CR>
nnoremap <silent> <leader>DC :exe ":profile continue"<CR>
nnoremap <silent> <leader>DQ :exe ":profile pause"<CR>:noautocmd qall!<CR>

" FILE
let g:which_key_map.f = { 'name' : '+file' }
nnoremap <silent> <Leader>fs :write<CR>
nnoremap <silent> <Leader>fa :wall<CR>
nnoremap <expr> <Leader>fS ':write ' . expand('%:p')
nnoremap <expr> <Leader>fo ':e ' . expand('%:p:h') . '/'
nnoremap <silent> <Leader>fp :FZFDirs<CR>
nnoremap <silent> <Leader>fa :w<CR>:call AltCommand(expand('%'), ':e')<CR>
nnoremap <silent> <Leader>ff :ProjectRootExe FZFFiles<CR>
nnoremap <silent> <Leader>fD :call delete(expand('%')) \| bdelete!<CR>
nnoremap <silent> <Leader>fn :enew<CR>
nnoremap <silent> <Leader>fr :FZFHistory<CR>
nnoremap <silent> <Leader>ft :NERDTreeToggle<CR>
nnoremap <silent> <Leader>fT :NERDTreeFind %<CR>
nnoremap <silent> <Leader>fy :let @* = expand("%")<CR>
nnoremap <silent> <Leader>fY :let @* = expand("%:p")<CR>

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
map <silent> <Leader>jw <Plug>(easymotion-bd-w)
map <silent> <Leader>jj <Plug>(easymotion-bd-f2)
map <silent> <Leader>jl <Plug>(easymotion-bd-jk)

" LISTS
let g:which_key_map.l = { 'name': '+lists' }
map <silent> <Leader>ll :call ToggleLocationList()<CR>
map <silent> <Leader>lq :call ToggleQuickfixList()<CR>

" QUIT
let g:which_key_map.q = { 'name' : '+quit' }
nnoremap <silent> <Leader>qq :confirm qall<CR>

" TOGGLES
let g:which_key_map.t = { 'name': '+toggle' }
" nnoremap <silent> <Leader>tc :let ayucolor=ayucolor==?'dark'?'light':'dark'<CR>:colorscheme ayu<CR>:mode<CR>
nnoremap <silent> <Leader>tb :call ToggleBackground()<CR>
nnoremap <silent> <Leader>tc :Colors<CR>
nnoremap <silent> <Leader>tl :set invlist<CR>
nnoremap <silent> <Leader>tn :set invnumber<CR>
nnoremap <silent> <Leader>tN :set invrelativenumber<CR>
nnoremap <silent> <Leader>tf :Filetypes<CR>
nnoremap <silent> <Leader>t- :let &scrolloff=999-&scrolloff<CR>
" nnoremap <silent> <Leader>t- :let g:scrollfix=g:scrollfix < 0 ? 60 : -1<CR>hl
nnoremap <silent> <Leader>tw :set invwrap<CR>

" WINDOW
let g:which_key_map.w = {'name': '+window' }
nnoremap <silent> <Leader>wd <C-W>c
let g:which_key_map.w.d = 'close'
nnoremap <silent> <Leader>wo <C-W>o
let g:which_key_map.w.o = 'only'
nnoremap <silent> <Leader>w= <C-W>=
let g:which_key_map.w['='] = 'equalize'

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
nnoremap <silent> <Leader>w- <C-W>s
let g:which_key_map.w.s = '[-] split'
nnoremap <silent> <Leader>w_ <C-W>v
nnoremap <silent> <Leader>wv <C-W>v
let g:which_key_map.w.v = '[|] split'


" TRANSFORMATIONS
let g:which_key_map.x = {'name': '+transform' }
map <silent> <Leader>xd <Plug>(textmanip-duplicate-down)
map <silent> <Leader>xD <Plug>(textmanip-duplicate-up)
map <silent> <Leader>xh <Plug>(textmanip-duplicate-left)
map <silent> <Leader>xl <Plug>(textmanip-duplicate-right)
map <Leader>xo gx
noremap <silent> <Leader>xu :MundoToggle<CR>
" noremap <Leader>xu :<C-u>UndotreeToggle<CR>
noremap <silent> <Leader>xq q
let g:which_key_map.x.q = 'macro'
noremap <silent> <Leader>x@ :r!date<CR>
" Swap stuff around
map <Leader>xx <Plug>(Exchange)
map <Leader>xX <Plug>(ExchangeClear)


" CLIPBOARD / YANK
let g:which_key_map.y = {'name': '+clipboard/yank' }
map <Leader>yt :let @+ = @0<CR>
let g:which_key_map.y.t = 'to clipboard'
map <Leader>yf :let @0 = @+<CR>
let g:which_key_map.y.f = 'from clipboard'
map <silent> <Leader>yy :FZFYank<CR>
map <silent> <Leader>yp :FZFPaste<CR>

" LOCAL LEADER
let g:which_key_local_map = {}

call which_key#register('<Space>', 'g:which_key_map')
call which_key#register(',', 'g:which_key_local_map')

nnoremap <silent> <Leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <Leader> :<c-u>WhichKeyVisual '<Space>'<CR>

nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual ','<CR>

" nnoremap <silent> [ :<c-u>WhichKey '['<CR>
" vnoremap <silent> [ :<c-u>WhichKeyVisual '['<CR>

" nnoremap <silent> ] :<c-u>WhichKey ']'<CR>
" vnoremap <silent> ] :<c-u>WhichKeyVisual ']'<CR>

" nnoremap <silent> g :<c-u>WhichKey  'g'<CR> " Kills gg
" nnoremap <silent> s :<c-u>WhichKey  's'<CR>


autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" "
" " autocmd! FileType term://*
" autocmd  FileType term://* set laststatus=0 noshowmode noruler
"       \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
"
function! <SID>AutoProjectRootCD()
  try
    if &filetype !=? 'help'
      ProjectRootCD
    endif
  catch
    " Silently ignore invalid buffers
  endtry
endfunction

autocmd BufEnter * call <SID>AutoProjectRootCD()

" " Go to last cursor position when reopening file
" if has('autocmd')
"   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"zz" | endif
" endif

" Start terminal in insert-mode
autocmd BufWinEnter,WinEnter term://* startinsert

" Connect to running nvim instance to avoid nested nvims
if has('nvim')
  let $GIT_EDITOR = 'nvr --remote-wait --servername ' . v:servername
  let $NVIM_LISTEN_ADDRESS = v:servername
endif

" Run a given vim command on the results of alt from a given path.
" See usage below.
function! AltCommand(path, vim_command)
  let l:alternate = system("alt " . a:path)
  if empty(l:alternate)
    echo "No alternate file for " . a:path . " exists!"
  else
    exec a:vim_command . " " . l:alternate
  endif
endfunction


let g:python3_host_prog = '/usr/local/bin/python3'

function! CreateCenteredFloatingWindow()
    let width = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.6)
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

function! ToggleVerbose()
    if !&verbose
        set verbosefile=~/.log/vim/verbose.log
        set verbose=15
    else
        set verbose=0
        set verbosefile=
    endif
endfunction

function! ToggleBackground()
  if &background==?'light'
    call Bg_dark()
  else
    call Bg_light()
  endif
  mode
endfunction

function! Bg_light()
  set background=light
  let $BAT_THEME = 'gruvbox-light'
endfunction

function! Bg_dark()
  set background=dark
  let $BAT_THEME = 'gruvbox'
endfunction

call Bg_light()
