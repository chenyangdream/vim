set nocompatible
set tabstop=4
set backspace=2
set number
set linebreak
set whichwrap=b,s,<,>,[,]
set hidden
set scrolloff=5
set hlsearch
set incsearch
set gdefault
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set laststatus=2
set ruler

set completeopt=longest,menu
filetype plugin indent on

syn on
set showmatch
set smartindent
set shiftwidth=4
set autoindent
set ai!
set autowrite "set auto save file
set foldmethod=syntax
set foldlevel=100
:filetype indent on
"set et
set ci
autocmd FileType make setlocal noexpandtab
"simulate the hot-key in MS Windows
"vmap <C-c> "yy
"vmap <C-x> "yd
"nmap <C-v> "yp
"vmap <C-v> "yp
"nmap <C-a> ggvG$

"operate window hot key
"virtal split current window
nmap wv <C-w>v 
"close current window
nmap wc <C-w>c 
"horizon split current windw
nmap ws <C-w>s 

"simulate window save command Ctrl+S
"imap <C-s> <Esc>:wa<cr>i<Right>
"nmap <C-s> :wa<cr>

"#########################################
" The following is the Plugins' setting
"#########################################
"
"TagList :Tlist
"
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
nnoremap <silent> <F8> :TlistToggle<CR>
"设置File Explorer 窗口的高度 防止TagList窗口被压缩得太小
let g:bufExplorerMaxHeight=30

"netwr file explorer :e <PATH>
"let g:netrw_winsize = 30 explorer window width

"QuickFix
"change to the next result
nmap <F6> :cn<cr> 
"change to the previous result
nmap <F7> :cp<cr> 

"WinManager :WMToggle
let g:winManagerWindowLayout='FileExplorer|TagList'
"normal mode command not Ex mode command
nmap wm :WMToggle<cr> 
nmap nt :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"MiniBufExp

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplorerMoreThanOne=0
nmap <silent> <F10> :TMiniBufExplorer<cr>
"cscope

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=1
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	endif
	set csverb
endif
:set cscopequickfix=s-,c-,d-,i-,t-,e-
:set cscopetag

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR> 

"<F3> to find the string 
nmap <slient> <F3> :Rgrep<CR>

"A
nmap <F12> :A<cr>

"NERD_commenter
"
let NERD_c_alt_style = 1 "change the c style commenter /**/ to //

"SuperTab :SuperTabHelp
"
"let g:SuperTabDefaultCompletionType="context"
let g:SuperTabRetainCompletionType = 2
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>

"CVim :help csupport
"
let g:C_Comments = "no" "use the c++ comment style
let g:C_BraceOnNewLine = "no" " '{' whether in a line alone
let g:C_AuthorName = "Chen Yang"
let g:C_Project="F9"
let g:Cpp_Template_Function = "c-funtion-description-chenyang"
let g:C_TypeOfH = "c" " *.h  is c or c++ file

execute pathogen#infect()

"inoremap { {<CR>}<ESC>kA<CR>
"inoremap " ""<ESC>i
"inoremap ' ''<ESC>i
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"cancel the hightlisght status after the match the search content
nmap <silent> <C-N> :silent noh<CR>
:set tags=/usr/include/tags
":set tags=/home/chenyang/source/c/unpv1src/tags
":set tags=/home/chenyang/source/work/myp2pserver/taishan/server/frammecommon/tags
":set tags=/home/chenyang/source/work/myp2pserver/taishan/server/srvframme/tags
":set tags=/home/chenyang/source/work/myp2pserver/taishan/server/flashlogsrv/flashlogsrv/src/tags
":set tags=/home/chenyang/source/work/myp2pserver/taishan/server/tags
:set tags=/home/chenyang/source/work/p2p_server/branches/taishan/server/cdn/mxtransmaster/tags
set foldmethod=indent
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>
":set list
":set listchars=tab:>-,trail:-
nmap <c-h> <esc><c-w>h
nmap <c-j> <esc><c-w>j
nmap <c-k> <esc><c-w>k
nmap <c-l> <esc><c-w>l
nmap vs <esc>:vsplit<cr>
nmap ss <esc>:split<cr>
:runtime! ftplugin/man.vim

call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
call plug#end()
cmap w!! w !sudo tee > /dev/null %
