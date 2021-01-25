#==============================================================================
# title          : .zshrc-components/asdf.haskell.sh
# description    : This file contains my zsh configurations for asdf haskell
# author         : Adi Iyengar
# username       : aditya7iyengar
# date_created   : 2020-01-11
# version        : 0.9
# usage          : link/move to ~/.zshrc-components/asdf.haskell.sh
# notes          : This adds a zsh config for asdf haskell
# versions       : Tmux 2.x, Zsh 5.x
#==============================================================================

if [[ -e $HOME/.cabal/bin ]]; then
  export PATH=$PATH:$HOME/.cabal/bin
fi
