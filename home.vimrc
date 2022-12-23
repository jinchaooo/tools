set tabstop=4
set shiftwidth=4
"set expandtab
set hlsearch
"colorscheme desert
syntax on

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

" <C-R>= put the value of the expression to command line buffer
" nnoremap for normal mode, inoremap for insert mode
nnoremap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nnoremap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
inoremap jj <esc>
nnoremap LL <C-w>l 
nnoremap HH <C-w>h 
nnoremap JJ <C-f> 
nnoremap KK <C-b> 
nnoremap J L 
nnoremap MM :tabe<CR>
nnoremap II :tabp<CR>
nnoremap OO :tabn<CR>
vnoremap M  :s,^\(\s*\),\1//@@,<CR>:let @/ = ""<CR>
vnoremap U  :s,^\(\s*\)//@@,\1,<CR>:let @/ = ""<CR>
nnoremap mx :e %:p:s,.h$,.xxx,:s,.cc$,.h,:s,.xxx$,.cpp,<CR>
nnoremap mz :e %:p:s,.h$,.xxx,:s,.c$,.h,:s,.xxx$,.cc,<CR>
nnoremap ms :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap mg :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap mc :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap mt :cs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap me :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap mf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap mi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nnoremap md :cs find d <C-R>=expand("<cword>")<CR><CR>

" mark //@@ as red
match WarningMsg /\/\/@@/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle staff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To install Vundle, run the following:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
""Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
""Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
""Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
""Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
" <<< for the first time, open vim and run :PluginInstall to install plugin >>>
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType vue AutoFormatBuffer prettier
augroup END
