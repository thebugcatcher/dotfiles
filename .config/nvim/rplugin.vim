" ========================================================================
" title          : .config/nvim/rplugin.vim
" description    : This file updates usage for plugins for nvim
" author         : Adi Iyengar
" username       : aditya7iyengar
" date_created   : 2017-02-01
" version        : 0.9
" usage          : link/move to ~/.config/nvim/rplugin.vim
" versions       : NVim 0.4.4
" ========================================================================

call remote#host#RegisterPlugin('python3', '$HOME/.vim/bundle/deoplete.nvim/rplugin/python3/deoplete', [
      \ {'sync': v:false, 'name': '_deoplete_init', 'type': 'function', 'opts': {}},
     \ ])

call remote#host#RegisterPlugin('python3', '$HOME/.vim/bundle/far.vim/rplugin/python3/far', [
      \ {'sync': v:false, 'name': '_far_nvim_rpc_async_invoke', 'type': 'function', 'opts': {}},
     \ ])
