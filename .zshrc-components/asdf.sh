#==============================================================================
# title          : .zshrc-components/asdf
# description    : This file contains my zsh configurations for usage with asdf
# author         : Adi Iyengar
# username       : aditya7iyengar
# date_created   : 2017-02-01
# version        : 0.9
# usage          : link/move to ~/.zshrc-components/asdf
# notes          : This adds a zsh config for asdf package manager
# versions       : Tmux 2.x, Zsh 5.x
#==============================================================================
autoload -U +X bashcompinit && bashcompinit

if [[ -e $HOME/.asdf/asdf.sh ]]; then
  . $HOME/.asdf/asdf.sh
fi

if [[ -e $HOME/.asdf/completions/asdf.bash ]]; then
  . $HOME/.asdf/completions/asdf.bash
fi
