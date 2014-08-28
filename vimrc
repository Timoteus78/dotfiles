set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'marijnh/tern_for_vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/unite.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'pangloss/vim-javascript'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'bling/vim-airline'
" Plugin 'Shougo/vimproc.vim'

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

" My settings
set nu
set nowrap
" NerdTree
nnoremap <leader>t :<C-u> NERDTree<CR>
" Unite
call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', join([
        \ '\.git\/',
        \ '\.svn\/',
        \ '\/\(image\|img\)\/',
        \ 'node_modules',
        \ 'vendor'
        \ ], '\|'))
	" Note: with large projects this may cause some performance problems. Normally it is recommended to use unite-source-file_rec/async source, which requires vimproc.
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>r :<C-u>Unite -start-insert file_rec<CR>
" Solarized
syntax enable
set background=dark "overriding bg color possible from OS X 10.7+
colorscheme solarized
" Airline
set laststatus=2
" marijnh/tern_for_vim

