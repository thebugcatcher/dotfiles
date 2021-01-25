" ========================================================================
" title          : .vimrc-components/gen-config.vim
" description    : This file contains general configuration for vim
" author         : Adi Iyengar
" username       : aditya7iyengar
" date_created   : 2017-02-01
" version        : 0.9
" usage          : link/move to ~/.vimrc-components/gen-config.vim
" versions       : NVim 0.4.4
" ========================================================================

" Relative line numbers by default
set number relativenumber

" Width of line numbers column
set numberwidth=5

" Works better with other plugins like powerline
set showtabline=0

" Allow backspace in insert mode
set backspace=indent,eol,start

" Store past 5000 commands
set history=5000

" Show incomplete commands at the bottom
set showcmd

" Show current mode at the bottom
set showmode

" Disable cursor blink (it's annoying)
set gcr=a:blinkon0

" Disable error bells (they're annoying)
set visualbell

" Auto reload files changed outside vim
set autoread

" Allows background unchanged buffers
" Avoids "No write since last change" errors
set hidden

" What's life without syntax highlighting
syntax on

" More Ergonomic leader: `,` instead of `\`
" This needs to happen before loading plugins, functions and mappings
let mapleader=","
