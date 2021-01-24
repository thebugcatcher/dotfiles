" ========================================================================
" title          : vimrc
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
if !empty(expand("./vimrcs/gen-config"))
  source "./vimrcs/gen-config"
endif

" Load Vundle, plugin manager
if !empty(expand("./vimrcs/vundle"))
  source "./vimrcs/vundle"
endif

" Load General plugins
if !empty(expand("./vimrcs/gen-plugins"))
  source "./vimrcs/gen-plugins"
endif

" Load Languages
if !empty(expand("./vimrcs/elixir"))
  source "./vimrcs/elixir"
endif

if !empty(expand("./vimrcs/rust"))
  source "./vimrcs/rust"
endif

if !empty(expand("./vimrcs/haskell"))
  source "./vimrcs/haskell"
endif

if !empty(expand("./vimrcs/ruby"))
  source "./vimrcs/ruby"
endif

if !empty(expand("./vimrcs/go"))
  source "./vimrcs/go"
endif

" Generic Functions and Mappings
if !empty(expand("./vimrcs/functions"))
  source "./vimrcs/function"
endif

if !empty(expand("./vimrcs/mappings"))
  source "./vimrcs/mappings"
endif
