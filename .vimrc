set nocompatible              " 去除VI一致性,必须
filetype off                  " 必须
syntax enable
set background=dark

colorscheme solarized
"colorscheme peachpuff

"colorscheme default 
"let g:molokai_original=1
"set t_Co=256
nmap <leader>w :q!<CR>
set cursorline
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi CursorLine   cterm=NONE ctermbg=yellow ctermfg=white guibg=darkred guifg=white
hi VertSplit ctermbg=red 
hi StatusList cterm=NONE ctermbg=yellow ctermfg=red guibg=red guifg=red
" Go to definition else declaration
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '/root/.vim/.ycm_extra_conf.py'
" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " 另一种选择, 指定一个vundle安装插件的路径
" "call vundle#begin('~/some/path/here')

" " 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'
"
" " 以下范例用来支持不同格式的插件安装.
" " 请将安装插件的命令放在vundle#begin和vundle#end之间.
" " Github上的插件
" " 格式为 Plugin '用户名/插件仓库名'
Plugin 'tpope/vim-fugitive'
" " 来自 http://vim-scripts.org/vim/scripts.html 的插件
"Plugin '插件名称' 实际上是 Plugin 'vim-scripts/插件仓库名'
" 只是此处的用户名可以省略
"Plugin 'L9'
" " 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址'
"Plugin 'git://git.wincent.com/command-t.git'
" " 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径'
"Plugin 'file:///home/gmarik/path/to/plugin'
" " 插件在仓库的子目录中.
" " 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'winmanager'
" " 安装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突
Plugin 'ascenator/L9', {'name': 'newL9'}
"
"Bundle 'Valloric/YouCompleteMe'
" completion/coding
"Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs' "自动括号匹配
Plugin 'scrooloose/nerdcommenter'
Plugin'tpope/vim-surround'
Plugin 'junegunn/vim-easy-align'
" looking
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/syntastic'
Plugin 'myusuf3/numbers.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
" utils
Plugin 'asins/vimcdoc'
Plugin 'Mark--Karkat'
Plugin 'repeat.vim'
Plugin 'ccvext.vim'
Plugin 'CodeFalling/fcitx-vim-osx'
Plugin 'rhysd/nyaovim-markdown-preview'
Plugin 'kassio/neoterm'
" navigation
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'wesleyche/SrcExpl'
Plugin 'majutsushi/tagbar'
Plugin 'taglist.vim'
Plugin 'rizzatti/dash.vim'
" c/c++
Plugin 'c.vim'
" java
Plugin 'artur-shaik/vim-javacomplete2'

"html/css/javascript
Plugin 'mattn/emmet-vim'
" scala
Plugin 'ensime/ensime-vim'
Plugin 'derekwyatt/vim-scala'
"  Plug 'ktvoelker/sbt-vim'
"  Plug 'megaannum/vimside'
" " 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须
" " 将你自己对非插件片段放在这行之后

"-- Cscope setting --
if has("cscope")
set csprg=/usr/bin/cscope " 指定用来执行cscope的命令
set csto=0 "
"设置cstag命令查找次序：0先找cscope数据库再找标签文件；1先找标签文件再找cscope数据库
set cst " 同时搜索cscope数据库和标签文件
set cscopequickfix=s-,c-,d-,i-,t-,e- " 使用QuickFix窗口来显示cscope查找结果
set nocsverb
if filereadable("cscope.out") "
"若当前目录下存在cscope数据库，添加该数据库到vim
cs add cscope.out
elseif $CSCOPE_DB != "" "
"否则只要环境变量CSCOPE_DB不为空，则添加其指定的数据库到vim
cs add $CSCOPE_DB
endif
set csverb
" 将:cs find c等Cscope查找命令映射为<C-_>c等快捷键（按法是先按Ctrl+Shift+-,
" 然后很快再按下c）
nmap <C->s :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C->g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C->d :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C->c :cs find c <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C->t :cs find t <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C->e :cs find e <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C->f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C->i :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>
" QuickFix 上下移动
nmap tm :cn<CR>
nmap tp :cp<CR>
nmap th :set hls<CR>
nmap tn :set nohls<CR>
nmap to :cw<CR>
nmap tc :cclose<CR>
nmap t; :close<CR>
nmap tm :marks<CR>
nmap tl :Tlist<cr>
endif"
"-- Taglist setting --
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=1"让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
""是否一直处理tags.1:处理;0:不处理
let Tlist_Process_File_Always=1 "实时更新tags
let Tlist_Inc_Winwidth=0"
"-- WinManager setting --
"let g:winManagerWindowLayout='FileExplorer|TagList' " 设置我们要管理的插件
let g:winManagerWindowLayout='FileExplorer' " 设置我们要管理的插件
let g:persistentBehaviour=0 " 如果所有编辑文件都关闭了，退出vim
nmap wm :WMToggle<cr>
