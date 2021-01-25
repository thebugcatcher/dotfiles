" ========================================================================
" title          : .vimrc
" description    : This file contains configurations for vim/nvim
" author         : Adi Iyengar
" username       : aditya7iyengar
" date_created   : 2017-02-01
" version        : 0.9
" usage          : link/move to ~/.vimrc or follow nvim guidelines
" versions       : NVim 0.4.4
" ========================================================================

" Allows testing without making it system-wide
set nocompatible

" Required by Vundle; Allows Vundle to manage itself
filetype off

" Load General config if exists
if !empty(expand("./.vimrc-components/gen-config.vim"))
  source "./.vimrc-components/gen-config.vim"
endif

" Load Vundle, plugin manager
if !empty(expand("./.vimrc-components/vundle.vim"))
  source "./.vimrc-components/vundle.vim"
endif

" Load Custom vim config
if !empty(expand("./.vimrc-components/custom.vim"))
  source "./.vimrc-components/custom.vim"
endif

" Load Languages
if !empty(expand("./.vimrc-components/languages.vim"))
  source "./.vimrc-components/languages.vim"
endif

" Generic Functions and Mappings
if !empty(expand("./.vimrc-components/functions.vim"))
  source "./.vimrc-components/functions.vim"
endif

if !empty(expand("./.vimrc-components/mappings.vim"))
  source "./.vimrc-components/mappings.vim"
endif
