#==============================================================================
# title          : .zshrc-components/asdf.direnv.sh
# description    : This file contains my zsh configurations for asdf direnv
# author         : Adi Iyengar
# username       : aditya7iyengar
# date_created   : 2020-01-11
# version        : 0.9
# usage          : link/move to ~/.zshrc-components/asdf.direnv.sh
# notes          : This adds a zsh config for asdf direnv
# versions       : Tmux 2.x, Zsh 5.x
#==============================================================================

# Hook direnv into zsh
if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi
