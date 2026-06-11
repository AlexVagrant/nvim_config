"let g:python_host_prog = '/usr/bin/python'  " here if python --version show 3.0+ you should use let g:python_host_prog = '/usr/bin/python2'
"let g:python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.7/bin/python3'
set hidden "set relativenumber
set number
set encoding=UTF-8
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent "自动缩进
set copyindent "复制保持原来的缩进
set smartindent
" 默认选择第一个提示
set completeopt=menu,noinsert

set expandtab
" if macunix{
"开始折叠
set foldenable
"用缩进表示折叠
set foldmethod=indent
"打开文件是默认不折叠代码
set foldlevelstart=99
"zc      折叠
"zC     对所在范围内所有嵌套的折叠点进行折叠
"zo      展开折叠
"zO     对所在范围内所有嵌套的折叠点展开
"[z       到当前打开的折叠的开始处。
"]z       到当前打开的折叠的末尾处。
"zj       向下移动。到达下一个折叠的开始处。关闭的折叠也被计入。
"zk      向上移动到前一折叠的结束处。关闭的折叠也被计入。
" }

set ruler                   " 打开状态栏标尺
syntax on               " 自动语法高亮
set hlsearch                " 搜索时高亮显示被找到的文本
set showmatch
set cursorline              " 高亮当前行
set nobackup 		            " 不创建备份文件			
set infercase               " 区分大小写




"set term=xterm-256color
if has("termguicolors")
  "set termguicolors
endif

"set background=light " 白色
set background=dark " 白色
"colorscheme space_vim_theme
"colorscheme monokai_pro
colorscheme monokai
"colorscheme janah 

" tree
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25

" if map {

let mapleader = ','
" 清除搜索字符
nmap <silent> <leader>/ :nohlsearch<CR>
" 窗口切换
"map <C-J> <C-W>j<C-W>_
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h
" 标签页切换
map <S-H> gT
map <S-L> gt
nmap <leader>v "+gp
nmap <leader>c "+y
nmap <leader>t :tabnew<CR><C-E>
"}

call plug#begin('~/.config/plugin')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'rust-lang/rust.vim'

" 全局搜索插件 Ack'
Plug 'wincent/ferret'
" Typescript 高亮插件
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
" NerdTree
"Plug 'scrooloose/nerdtree'
" airline
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

"galaxyline
"Plug 'glepnir/galaxyline.nvim' , { 'branch': 'main' }
"Plug 'ryanoasis/vim-devicons'       " vimscript

"lualine
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" if jsx or React
Plug 'sheerun/vim-polyglot'
" neovim 快速跳转插件
Plug 'Lokaltog/vim-easymotion'
" 文件搜索
Plug 'ctrlpvim/ctrlp.vim'
" 标签
Plug 'mattesgroeger/vim-bookmarks'
" 启动页
Plug 'mhinz/vim-startify'
" git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
" 改变包围结构
Plug 'anyakichi/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'jparise/vim-graphql'
Plug 'google/vim-colorscheme-primary'
Plug 'liuchengxu/vista.vim'
" org mode
" theme
Plug 'flazz/vim-colorschemes'
Plug 'Mofiqul/vscode.nvim'
" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'phanviet/vim-monokai-pro'
Plug 'chemzqm/wxapp.vim'
Plug 'navarasu/onedark.nvim'
Plug 'vimwiki/vimwiki'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" vista
Plug 'liuchengxu/vista.vim'
" calendar
Plug 'itchyny/calendar.vim'

call plug#end()

inoremap jj <ESC>

" Ack 快捷键
" Instead of <leader>a, use <leader>x.
nmap <leader>x <Plug>(FerretAck)
" Instead of <leader>s, use <leader>z.
nmap <leader>z <Plug>(FerretAckWord)

" 搜索文件
nnoremap <silent> <c-p> :Files <CR>
"}

" if NerdTree {
"map <C-e> :NERDTreeToggle<CR>
"map <leader>e :NERDTreeFind<CR>
"nmap <leader>nt :NERDTreeFind<CR>
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'
"" 显示隐藏文件
"let NERDTreeShowHidden=1
"" 显示书签列表
"let NERDTreeShowBookmarks=1

" if airline {
"let g:airline_theme='hybrid'
"let g:airline_theme='molokai'

"set laststatus=2  "永远显示状态栏
"let g:airline_powerline_fonts = 1  " 支持 powerline 字体
"let g:airline#extensions#tabline#enabled = 1 " 显示窗口tab和buffer

"if !exists('g:airline_symbols')
  "let g:airline_symbols = {}
"endif
" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'

"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.notexists = '∄'
"let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.maxlinenr = ''
"}

" if jsx {
let g:jsx_ext_required = 0
autocmd BufNewFile,BufRead *.tsx  set filetype=typescript.tsx
autocmd BufRead,BufNewFile *.tsx setlocal syntax=typescript.jsx
au BufNewFile,BufRead *.js,*.javascript,*.es,*.mjs   setf javascript 

"}

" if ts | tsx {
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
let g:yats_host_keyword = 1
"}

" if ctrlp {
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
"let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
"      \ --ignore .git
"      \ --ignore node_modules
"      \ --ignore .svn
"      \ --ignore .hg
"      \ --ignore .DS_Store
"      \ --ignore "**/*.pyc"
"      \ --ignore "**/*.swp"
"      \ --ignore "**/*.swo"
"      \ -g ""'
""}

"if Tagbar {
"nnoremap <silent> <leader>tt :TagbarToggle<CR>

"if vimwiki {
let g:vimwiki_listsyms = '✗○◐●✓'
"endif

"let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_type_javascript = {
      \ 'ctagsbin': 'ctags',
      \ 'ctagstype': 'javascript',
      \ 'kinds': [
        \ 'a:arrays',
        \ 'p:properties',
        \ 't:tags',
        \ 'o:objects',
        \ 'g:generator functions',
        \ 'f:functions',
        \ 'c:constructors/classes',
        \ 'm:methods',
        \ 'v:variables',
        \ 'i:imports',
        \ 'e:exports',
        \ 's:styled components'
        \ ]}

let g:tagbar_type_typescript = {
      \ 'ctagsbin': 'ctags',
      \ 'ctagstype': 'typescript',
      \ 'kinds': [
        \ 'c:classes',
        \ 'n:modules',
        \ 'f:functions',
        \ 'v:variables',
        \ 'v:varlambdas',
        \ 'm:members',
        \ 'i:interfaces',
        \ 'e:enums',
        \ ]
        \ }
"}

noremap <silent> <leader>tt :Vista coc<CR>

"if vista {
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works for the kind renderer, not the tree renderer.
"let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_icon_indent = ["▸ ", ""]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
      \ 'cpp': 'vim_lsp',
      \ 'php': 'vim_lsp',
      \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
      \   "function": "\uf794",
      \   "variable": "\uf71b",
      \  }

"}

"if jsbeautify {
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

"autocmd BufNewFile,BufRead *.ts set filetype=typescript
"au BufNewFile,BufRead *.tsx set filetype=typescript

let g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>gc'
let g:minimap_toggle='<leader>gt'

"bookmark
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1

" orgmode.nvim

"au BufWritePost *.vim source $MYVIMRC | AirlineRefresh
"au BufWritePost .vimrc source $MYVIMRC | AirlineRefresh

" Use preset argument to open it
nnoremap <leader>ed :CocCommand explorer --preset .vim<CR>
nnoremap <leader>ef :CocCommand explorer --preset floating<CR>
nnoremap <leader>ec :CocCommand explorer --preset cocConfig<CR>
nnoremap <leader>eb :CocCommand explorer --preset buffer<CR>
nmap <leader>e :CocCommand explorer <CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" List all presets
nnoremap <leader>el :CocList explPresets
"}

"markdown map
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"date 
nmap <leader>rd i<C-R>=strftime("%Y-%m-%d %a")<CR><Esc>
imap <leader>rd  <C-R>=strftime("%Y-%m-%d %a")<CR>
"time 
nmap <leader>rt i<C-R>=strftime("%H:%M:%S")<CR><Esc>
imap <leader>rt <C-R>=strftime("%H:%M:%S")<CR>
command Date execute "normal i<C-R>=strftime('%F %T')<CR><ESC>"

" calendar
nmap <leader>ca :Calendar<cr>
autocmd FileType calendar nmap <buffer> <CR> :<C-u>call vimwiki#diary#calendar_action(b:calendar.day().get_day(), b:calendar.day().get_month(), b:calendar.day().get_year(), b:calendar.day().week(),"V")<CR>
let g:rustfmt_autosave = 1
let g:rust_cargo_use_clippy = 1
" need FiraCode font-family
"require('plugins')
"require('rust-tools-configuration')
lua << END
pcall(require, 'evil_lualine')
pcall(require, 'coc')
END

