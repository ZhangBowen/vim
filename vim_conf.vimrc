" vundle
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" python complement
Plugin 'pythoncomplete'
" Bundle 'Valloric/YouCompleteMe'
Bundle 'Valloric/ListToggle'
"Bundle 'scrooloose/syntastic'
" 左侧导航栏
Bundle 'vim-scripts/The-NERD-tree'
" 标签导航
Bundle 'majutsushi/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Solarized Colorscheme for Vim
syntax on
set background=dark
"colorscheme solarized

" Configuration file for vim
set modelines=0     " CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible    " Use Vim defaults instead of 100% vi compatibility
set backspace=2     " more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup
" show line number
set nu
" set tab = 4 spaces
set ts=4
" 4 spaces between levels
set sw=4
" keyword highlight
syntax on
" real-time search
set incsearch
" search highlight
set hlsearch
" smart indent
filetype plugin on
" charset
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030,cp936

" python
filetype plugin indent on
autocmd FileType python setlocal et sta sw=4 sts=4 omnifunc=pythoncomplete#Complete
autocmd FileType cpp,c setlocal et sta sw=2 sts=2 ts=2 omnifunc=pythoncomplete#Complete

" auto close preview window
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif

" auto input pair char
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=ClosePair('}')<CR>

function ClosePair(char)
        if getline('.')[col('.') - 1] == a:char
                return "\<Right>"
        else
                return a:char
        endif
endf

"-----有关 NERDTree 插件-----
"如果 NERDTree 窗口是最后一个窗口，则退出 vim
let NERDTree_Exit_OnlyWindow=1
"启动vim自动打开NERDTree
" autocmd VimEnter * NERDTree
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
