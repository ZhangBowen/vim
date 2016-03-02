filetype plugin indent on    " required
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
