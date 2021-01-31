" ========================================================================
" title          : .config/nvim/init.vim
" description    : This file helps run nvim using vim configurations
" author         : Adi Iyengar
" username       : aditya7iyengar
" date_created   : 2017-02-01
" version        : 0.9
" usage          : link/move to ~/.config/nvim/init.vim
" versions       : NVim 0.4.4
" ========================================================================

" Cool .vim plugins and .vimrc
set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source ~/.vimrc

set termguicolors

" colorscheme NeoSolarized
set background=dark
