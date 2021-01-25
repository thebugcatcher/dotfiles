" ========================================================================
" title          : .vimrc-components/vundle.vim
" description    : This file contains vundle (package manager) set up
" author         : Adi Iyengar
" username       : aditya7iyengar
" date_created   : 2017-02-01
" version        : 0.9
" usage          : link/move to ~/.vimrc-components/vundle.vim
" versions       : NVim 0.4.4
" ========================================================================

" =============== Vundle Initialization ===============

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Powerline
Plugin 'powerline/powerline'

" LSP
" Plugin 'neoclide/coc.nvim'

" git wrapper :Gsplit, :Gvsplit, :Gtabedit, :Gstatus etc
" https://vimawesome.com/plugin/fugitive-vim
Plugin 'tpope/vim-fugitive'

" file system explorer for the Vim editor
" https://vimawesome.com/plugin/nerdtree-red
Plugin 'scrooloose/nerdtree'

" A plugin of NERDTree showing git status flags
" https://github.com/Xuyuanp/nerdtree-git-plugin
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Comment functions so powerful—no comment necessary.
" https://vimawesome.com/plugin/the-nerd-commenter
Plugin 'scrooloose/nerdcommenter'

" Lean & mean status/tabline for vim that's light as air.
" With themes
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'kien/ctrlp.vim'

" Color-scheme Archery
Plugin 'Badacadabra/vim-archery'
Plugin 'kristijanhusak/vim-hybrid-material'

" Vim Tmux Navigation
Plugin 'christoomey/vim-tmux-navigator'

" Distraction-Free writing in Vim
Plugin 'junegunn/goyo.vim'

" Highlights specific pieces of code
Plugin 'junegunn/limelight.vim'

" Vim Markdown and Tablular Syntax Highlighting
Plugin 'godlygeek/tabular'

" Vim Languages
Plugin 'vim-ruby/vim-ruby.git'
Plugin 'skwp/vim-html-escape'
Plugin 'mxw/vim-jsx'
Plugin 'jparise/vim-graphql'
Plugin 'rhysd/vim-crystal'
Plugin 'kchmck/vim-coffee-script'
Plugin 'ekalinin/Dockerfile.vim'

" Vim Elixir Syntax and Helpers
Plugin 'elixir-editors/vim-elixir'
Plugin 'mhinz/vim-mix-format'

" Vim Elm Plugin
Plugin 'elmcast/elm-vim'

" Multiple Cursors
Plugin 'terryma/vim-multiple-cursors'

" TOML
Plugin 'cespare/vim-toml'
au BufRead,BufNewFile *.toml set filetype=toml

" Quoting and Parenthesizing
Plugin 'tpope/vim-surround'

" Shows git diff in gutter/side column
Plugin 'airblade/vim-gitgutter'

" Asynchronous Lint Engine
Plugin 'w0rp/ale'

" Motion on speed
Plugin 'easymotion/vim-easymotion'

" File type sensible comment
Plugin 'tomtom/tcomment_vim'

" Deoplete for autocomplete features (requires neovim with python 3 support)
Plugin 'shougo/deoplete.nvim'

" Visualize Vim Undo tree like Git
Plugin 'mbbill/undotree'

" Yank History
Plugin 'YankRing.vim'

" CamelCaseMotion
Plugin 'bkad/camelcasemotion'

" Far Find and Replace in multiple files
Plugin 'brooth/far.vim'

" Search over files using Silver Searcher
Plugin 'ervandew/ag'

" Align parameters (for Settings seeds)
Plugin 'junegunn/vim-easy-align'

filetype plugin indent on
filetype on

" All of your Plugins must be added before the following line
call vundle#end()
