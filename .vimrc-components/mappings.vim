" ========================================================================
" title          : .vimrc-components/mappings.vim
" description    : This file contains mappings and functions for vim
" author         : Adi Iyengar
" username       : aditya7iyengar
" date_created   : 2017-02-01
" version        : 0.9
" usage          : link/move to ~/.vimrc-components/mappings.vim
" versions       : NVim 0.4.4
" ========================================================================

" Toggle relative line number (great for pairing)
let s:relative = 1

function! ToggleRelative()
    if s:relative  == 0
        let s:relative = 1
        set nonumber
        set number relativenumber

    else
        let s:relative = 0
        set nonumber
        set number norelativenumber

    endif
endfunction

noremap <silent> <leader>a :call ToggleRelative()<CR>

nnoremap <leader>yr :YRShow<CR>

" ,t instead of Ctrl-P to not interfere with paste/yankring
let g:ctrlp_map = ',t'

" Mapping to search in project
nnoremap <silent> <leader>t :CtrlP<CR>

" Mapping to search in a buffer
nnoremap <silent> <leader>b :CtrlPBuffer<CR>

" Mapping clear the cache mnemonic: (c)lear (c)ache
nnoremap <silent> <leader>cc :ClearCtrlPCache<CR>

" Mapping to jump to a method
nnoremap <silent> <leader>j :CtrlPBufTag<CR>

" Rails mapping
map ,ja :CtrlP app/assets<CR>
map ,jm :CtrlP app/models<CR>
map ,jc :CtrlP app/controllers<CR>
map ,jv :CtrlP app/views<CR>
map ,jj :CtrlP app/assets/javascripts<CR>
map ,jh :CtrlP app/helpers<CR>
map ,jl :CtrlP lib<CR>
map ,jp :CtrlP public<CR>
map ,js :CtrlP spec<CR>
map ,jf :CtrlP fast_spec<CR>
map ,jd :CtrlP db<CR>
map ,jC :CtrlP config<CR>
map ,jV :CtrlP vendor<CR>
map ,jF :CtrlP factories<CR>
map ,jT :CtrlP test<CR>

" Open the project tree and expose current file in the nerdtree with Alt-\
" calls NERDTreeFind iff NERDTree is active, current window contains a
" modifiable file, and we're not in vimdiff
function! OpenNerdTree()
  if &modifiable && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
  else
    NERDTreeToggle
  endif
endfunction

if($DOTFILES_OS == "osx")
  echo "Running on " . $DOTFILES_OS

  " Use Ctrl + \ on mac (Map option key to Ctrl)
  nnoremap <silent> <C-\> :call OpenNerdTree()<CR>

  " Control movement of cursor after paste
  noremap p gp
  noremap P gP
  noremap gp p
  noremap gP P
else
  echo "Running on " . $DOTFILES_OS

  " Use Alt + \ on linux
  nnoremap <silent> <A-\> :call OpenNerdTree()<CR>
endif

" ================ Splits ===========================
" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" ================ Shortcuts ========================
" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
nnoremap <silent> ,cf :let @* = expand("%:~")<CR>
nnoremap <silent> ,cr :let @* = expand("%")<CR>
nnoremap <silent> ,cn :let @* = expand("%:t")<CR>

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" ToggleElixirLS if it's consuming a lot of CPU
function! ToggleElixirLs()
    if s:elixirls  == 0
        let s:elixirls = 1
        let g:ale_linters = {
        \   'javascript': ['eslint'],
        \   'elixir': ['elixir-ls']
        \}
        :echo "ElixirLS Enabled"

    else
        let s:elixirls = 0
        let g:ale_linters = {
        \   'javascript': ['eslint']
        \}
        :echo "ElixirLS Disabled"

    endif
endfunction
noremap <silent> <leader>l :call ToggleElixirLs()<CR>

" ============== Fix deoplete + Multi cursor bug ===========
" Disable Deoplete when selecting multiple cursors starts
function! Multiple_cursors_before()
    if exists('*deoplete#disable')
        exe 'call deoplete#disable()'
    elseif exists(':NeoCompleteLock') == 2
        exe 'NeoCompleteLock'
    endif
endfunction

" Enable Deoplete when selecting multiple cursors ends
function! Multiple_cursors_after()
    if exists('*deoplete#toggle')
        exe 'call deoplete#toggle()'
    elseif exists(':NeoCompleteUnlock') == 2
        exe 'NeoCompleteUnlock'
    endif
endfunction

" Extract to vim-haskell-format plugin
function! VisualFormatHS()
  silent exe "'<,'>%!stylish-haskell"
endfunction

function! VisualFormatEx()
  silent exe 'MixFormat'
endfunction

function! FileName()
  return expand('%:p')
endfu

function! CheckGuardfile()
  if FileName() == 'Guardfile'
    set filetype=ruby
  endif
endfu

autocmd BufRead * call CheckGuardfile()

let mapleader = ","
map <silent> <leader>f :call VisualFormatHS()<CR>
map <silent> <leader>e :call VisualFormatEx()<CR>

" TODO: Make these work on OSX
map <silent> <leader>mt :call TerminalPreviewMarkdown()<CR>
map <silent> <leader>mb :call BrowserPreviewMarkdown()<CR>

map <silent> <leader>th :call TerminalPreviewHexDump()<CR>

" Investigate termopen
function! TerminalPreviewMarkdown()
  new % | terminal ! mdv %
endfu

function! TerminalPreviewHexDump()
  new % | terminal ! xxd %
endfu

function! BrowserPreviewMarkdown()
  " let l:tmpfile = tempname() . ".html"
  let l:tmpfile = ".adi_temp_file_markdown_preview" . ".html"
  execute "!" . "rm " . l:tmpfile
  echo l:tmpfile
  execute "!" . "github-markdown % > " . l:tmpfile
  execute "!" . "xdg-open " . l:tmpfile
endfu

" Terminal RSpec
function! TerminalRSpec()
  let l:line = line('.')
  execute "!" . "RSPEC_RETRY_COUNT=1 bin/rspec %:" . l:line
endfu

" Run nearest test in a tmux terminal
let mapleader = ","
map <silent> <leader>r :TestNearest<CR>
map <silent> <leader>i :call IExExUnitRun()<CR>

" Convert snake_case to CamelCase
map <silent> <leader>+ :s/\(\%(\<\l\+\)\%(_\)\@=\)\\|_\(\l\)/\u\1\2/g<CR>

" Convert CamelCase to snake_case
map <silent> <leader>_ :s/\(\<\u\l\+\\|\l\+\)\(\u\)/\l\1_\l\2/g<CR>

" Remove duplicate lines
" s/^\(.*\)\(\n\1\)\+$/\1/
map <silent> <leader> d :s/^\(.*\)\(\n\1\)\+$/\1/<CR>

" Add elixir pry
function! AddPryBelow()
  call append(line("."), "require IEx; IEx.pry")
endfunction
map <silent> <leader>p :call AddPryBelow()<CR>
