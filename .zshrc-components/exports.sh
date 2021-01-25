#==============================================================================
# title          : .zshrc-components/exports.sh
# description    : This file contains my zsh exports
# author         : Adi Iyengar
# username       : aditya7iyengar
# date_created   : 2017-02-01
# version        : 0.9
# usage          : link/move to ~/.zshrc-components/exports.sh
# notes          : This adds zsh exports
# versions       : Tmux 2.x, Zsh 5.x
#==============================================================================

# Set Editor to NeoVim
export EDITOR="nvim"

export TERM=xterm-256color

export QT_STYLE_OVERRIDE=gtk
export QT_SELECT=qt5

# Set default language to US English
if [[ $LANG = '' ]]; then
  export LANG=en_US.UTF-8
fi

# XDG-User-dir well known directory
if [ -d "$HOME/.local/bin" ] ; then
  export PATH="$HOME/.local/bin:$PATH"
fi
