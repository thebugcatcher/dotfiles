" ========================================================================
" title          : .vimrc-components/languages.vim
" description    : This file contains programming lang configurations for vim
" author         : Adi Iyengar
" username       : aditya7iyengar
" date_created   : 2017-02-01
" version        : 0.9
" usage          : link/move to ~/.vimrc-components/languages.vim
" versions       : NVim 0.4.4
" ========================================================================

au BufRead,BufNewFile *.rb set filetype=ruby
au FileType ruby setl sw=2 sts=2 et iskeyword+=!,?

au BufRead,BufNewFile *.ex,*.exs,*.eex,*.leex set filetype=elixir
au FileType elixir setl sw=2 sts=2 et iskeyword+=!,?

au BufRead,BufNewFile *.gleam set filetype=gleam
au FileType elixir setl sw=2 sts=2 et iskeyword+=!,?

au BufRead,BufNewFile *.cr set filetype=crystal
au FileType crystal setl sw=2 sts=2 et iskeyword+=!,?

au BufRead,BufNewFile *.fl,*.flex,*.l,*.lm setlocal filetype=lex

au BufRead,BufNewFile *.y,*.ypp,*.ym setlocal filetype=yacc

au BufRead,BufNewFile *.elm set filetype=elm
au FileType elm setlocal softtabstop=4 shiftwidth=4 expandtab

" Required, tell ALE where to find Elixir LS
let g:ale_elixir_elixir_ls_release = expand("~/tools/elixir-ls/rel/")

" Optional, you can disable Dialyzer with this setting
let g:ale_elixir_elixir_ls_config = {'elixirLS': {'dialyzerEnabled': v:false}}
