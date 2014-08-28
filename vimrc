 if has('vim_starting')
   set nocompatible               " Be iMproved

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'nathanaelkane/vim-indent-guides'

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck

 "MySettings
syntax enable
set background=dark
colorscheme solarized 
set nu
nnoremap <leader>t :<C-u> NERDTree<CR>
call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', join([
        \ '\.git\/',
        \ '\.svn\/',
        \ '\/\(image\|img\)\/',
        \ 'node_modules',
        \ 'vendor'
        \ ], '\|'))
" Note: with large projects this may cause some performance problems. Normally it is recommended to use unite-source-file_rec/async source, which requires vimproc.
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <c-f> :Unite -start-insert file_rec<CR>
let g:neocomplete#enable_at_startup = 1
" Airline
    if has('statusline')
      set laststatus=2
      " Broken down into easily includeable segments
      set statusline=%<%f\    " Filename
      set statusline+=%w%h%m%r " Options
      set statusline+=%{fugitive#statusline()} "  Git Hotness
      set statusline+=\ [%{&ff}/%Y]            " filetype
      set statusline+=\ [%{getcwd()}]          " current dir
      set statusline+=%#warningmsg#
    "  set statusline+=%{SyntasticStatuslineFlag()}
      set statusline+=%*
      let g:syntastic_enable_signs=1
      set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

 " vim-indent-guides
 
