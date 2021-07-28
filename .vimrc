set encoding=UTF-8
set nocompatible " 关闭vi兼容模式
set ruler " 打开状态栏标尺
set cursorline " 突出显示当前行
set autochdir " 自动切换目录为当前文件所在目录
set incsearch "输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set showmatch " 插入括号时跳转到匹配的对应括号
set matchtime=2 " 短暂跳转到匹配括号的时间
set smartindent " 开启新行时使用智能自动缩进
set laststatus=2 "显示状态栏默认值为1不显示状态
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8
set number
set shiftwidth=4
set softtabstop=4
set expandtab
set noshowmode
set ignorecase
set laststatus=2
syntax on

" Key mapping
" Normal mode

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Toggle line number
nnoremap <F2> :set nu! <CR>

" Move cursor
nnoremap H 0
nnoremap L $

" Undo undo
map U <C-R>

noremap ; :

" new line
nnoremap <CR> a<CR><ESC>

" Visual mode

" Ident
vnoremap < <gv
vnoremap > >gv

" vim-plug
call plug#begin('~/.vim/plugged')

" Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'

Plug 'joshdick/onedark.vim'

Plug 'preservim/nerdtree'

" enhance nerdtree's tabs
" Plug 'jistr/vim-nerdtree-tabs'

" add beautiful icons besides files
" Plug 'ryanoasis/vim-devicons'

" A plugin of NERDTree showing git status flags.
" Plug 'Xuyuanp/nerdtree-git-plugin'

" enhance devicons
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'

" Initialize plugin system
call plug#end()

colorscheme onedark

" lightline
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

" NERDTree
" map a specific key or shortcut to open NERDTree
map <C-n> :NERDTreeToggle<CR>

" open a NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree

" open NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='.  a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'.  a:extension .'$#'
endfunction

" different highlighting for different file extensions
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" auto-pairs
let g:AutoPairs = {'(':')', '[':']', '{':'}', '<':'>', "'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
