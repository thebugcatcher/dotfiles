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

" Run tests
Plugin 'vim-test/vim-test'

" Run vim commands in small tmux pane
Plugin 'benmills/vimux'

" Super powered Writing
Plugin 'reedes/vim-pencil'

" Fancy abbreviation replacements
Plugin 'tpope/vim-abolish'

" Better spellcheck mappings
Plugin 'reedes/vim-lexical'

" Better autocorrections
Plugin 'reedes/vim-litecorrect'

" Gleam lang
Plugin 'gleam-lang/gleam.vim'

filetype plugin indent on
filetype on

" All of your Plugins must be added before the following line
call vundle#end()

" ================ Yankring =========================

let g:yankring_history_file = '.yankring-history'
let g:yankring_clipboard_monitor=0

" ================ CtrlP ============================

if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif

" Use ripgrep as CtrlP search engine
if executable('rg')
  " Use ripgrep for primary listing .Crazy fast and most configuratble
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --glob ""'

  " Ripgrep is fast enough to not need caching
  " This might change if there are multiple files with similar names
  let g:ctrlp_use_caching = 0
elseif executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command =
    \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$|\.beam" --ignore-dir "_build" --ignore-dir "node_modules" --ignore-dir "deps"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 1
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|_build)$',
  \ 'file': '\v\.(exe|so|dll|beam)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Don't jump to already open window. This is annoying if you are maintaining
" several Tab workspaces and want to open two windows into the same file.
let g:ctrlp_switch_buffer = 0

" ================ Nerd Tree ========================

" Auto open nerd tree on startup
let g:nerdtree_tabs_open_on_gui_startup = 0
" Focus in the main content window
let g:nerdtree_tabs_focus_on_files = 1
" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" Enable deoplate at startup
let g:deoplete#enable_at_startup = 1

" ================= Color scheme ===================
" colorscheme archery

let g:enable_bold_font = 1
let g:enable_italic_font = 1

set background=dark
colorscheme hybrid_material
let g:airline_theme = "hybrid"

" Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Optional, configure as-you-type completions
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1

" Running tests
let test#strategy = 'vimux'

augroup pencil
  autocmd!
  autocmd filetype markdown,mkd call pencil#init()
        \ | call lexical#init()
        \ | call litecorrect#init()
        \ | setl spell spl=en_us fdl=4 noru nonu nornu
        \ | setl fdo+=search
augroup END

 " Pencil / Writing Controls {{{
let g:pencil#wrapModeDefault = 'soft'
let g:pencil#textwidth = 74
let g:pencil#joinspaces = 0
let g:pencil#cursorwrap = 1
let g:pencil#conceallevel = 3
let g:pencil#concealcursor = 'c'
let g:pencil#softDetectSample = 20
let g:pencil#softDetectThreshold = 130

" Run elixir tests in iex
let g:test#elixir#exunit#iex = 0

function! IExExUnitRun() abort
  let g:test#elixir#exunit#iex = 1
  TestNearest
  let g:test#elixir#exunit#iex = 0
endfu

" Figure out a smart way to override these
function! test#elixir#exunit#executable() abort
  if g:test#elixir#exunit#iex == 1
    return 'iex -S mix test'
  elseif filereadable('mix.exs')
    return 'mix test'
  else
    return 'elixir'
  end
endfun

function! test#elixir#exunit#build_position(type, position) abort
  if test#elixir#exunit#executable() ==# 'mix test' || test#elixir#exunit#executable() ==# 'iex -S mix test'
    if a:type ==# 'nearest'
      if a:position['line'] > 1
        return [a:position['file'].':'.a:position['line']]
      else
        return [a:position['file']]
      endif
    elseif a:type ==# 'file'
      return [a:position['file']]
    else
      return []
    endif
  else
    if a:type ==# 'nearest' || a:type ==# 'file'
      return [a:position['file']]
    else
      return ['*.exs']
    end
  end
endfunction
