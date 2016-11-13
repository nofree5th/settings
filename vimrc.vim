if v:progname =~? "evim"
  finish
endif

set nocompatible

" encoding
set fileencodings=utf-8,ucs-bom,gb2312,cp936,big5
set termencoding=utf-8
set encoding=utf-8

set history=400
filetype plugin on

colorscheme desert "blue
syntax on

set autoread
set writebackup
set nobackup

set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,],h,l


set ruler
set showmatch
set showcmd
set number

set incsearch
set hlsearch

"for program
set path+=.
set fileformat=unix "equal to dos2unix
set expandtab
set tabstop=4
set softtabstop=4
"shiftwidth effect while smarttab is on,else tabstop
set shiftwidth=4

:highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
:match OverLength '\%120v.*'

"space shows
set listchars=tab:>-,trail:-
set list

set autoindent
set cindent

set tags=./tags,./TAGS,~/.tags,~/TAGS

imap <C-B> <Esc>i
imap <C-F> <Esc>la
imap <C-Z> <Esc>:w<CR><Esc>:sh<CR>
imap `( ()<Esc>i
imap `[ []<Esc>i
imap `{ {}<Esc>i
imap `I #include <><Esc>i
imap <F1> <CR>Date: <Esc>:read !date<CR>kJ
map <F2>  :buffers<CR>:buffer
map <F3>  :bprevious<CR>
map <F4>  :bnext<CR>
map <F5>  :Tlist<CR>
map <F6>  :TlistUpdate<CR>
map <F7>  :cprevious<CR>
map <F8>  :cnext<CR>
map <F9>  :w<CR> :make<CR> :copen<CR> <C-W>10_
map <F10> :call Search_Word()<CR>
map <F11> :nohlsearch<CR>
map <F12> :w<CR>

let mapleader = ","
map <silent> <leader>s :source $MYVIMRC<cr>
map <silent> <leader>e :e $MYVIMRC<cr>
"map <silent> <C-X> :q!<cr>
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

"taglist
nmap <silent> <leader>tl :TlistToggle<cr> "for taglist
let Tlist_Show_One_File = 0            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_File_Fold_Auto_Close = 1 "其他文件自动折叠
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"let Tlist_Auto_Open = 1

"winmanager
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
nmap <silent> <leader>wm :WMToggle<cr> 
let g:winManagerWindowLayout = "BufExplorer,FileExplorer"
"let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
               
set exrc

function! ChangeCurDir(...)
    let cur_dir = expand('%:h')
    execute "cd " . cur_dir
endfunction
function! EditCppFile(...)
    let file_prefix = expand('%:r')
    if filereadable(file_prefix . ".cpp")
        execute "e " . file_prefix . ".cpp"
    elseif filereadable(file_prefix . ".cc")
        execute "e " . file_prefix . ".cc"
    elseif filereadable(file_prefix . ".c")
        execute "e " . file_prefix . ".c"
    endif
endfunction
function! EditHeaderFile(...)
    let file_prefix = expand('%:r')
    execute "e " . file_prefix . ".h"
endfunction
function! GrepCurWord(...)
    let args=a:000
    if empty(args)
        let args=["*"]
    endif
    let cur_word= expand('<cword>')
    execute "grep " . cur_word . " " . join(args)
endfunction

command! Se call SetPath()
command! Cd call ChangeCurDir()
command! Ecpp call EditCppFile()
command! Ehead call EditHeaderFile()
command! -nargs=* Gr call GrepCurWord(<f-args>)
set noic

"format
function! CppFormat()
    let file_path = expand('%:p')
    execute "silent !cppstyle -i " . file_path
    execute ":e"
    execute ":se filetype=cpp"
endfunction
autocmd! BufWritePost *.cpp call CppFormat()
autocmd! BufWritePost *.h call CppFormat()

function! ProtoFormat()
    let file_path = expand('%:p')
    execute "silent !protostyle -i " . file_path
    execute ":e"
    execute ":se filetype=proto"
endfunction
autocmd! BufWritePost *.proto call ProtoFormat()
inoremap jk <esc>
