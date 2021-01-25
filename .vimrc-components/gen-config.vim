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

" ================ Completion =======================
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=deps/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.beam

" ================ Scrolling ========================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=2

" ================ Search ===========================
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
" set ignorecase    " Ignore case when searching...

" ================ Whitespace killer =====================
autocmd BufWritePre * :%s/\s\+$//e

" ================= 80 Char line =========================
set colorcolumn=80

" ================= Numbers width =======================
set number

" ================= Use H L K J =========================
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" More Ergonomic leader: `,` instead of `\`
" This needs to happen before loading plugins, functions and mappings
let mapleader=","
