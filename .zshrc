#==============================================================================
# title          : zshrc
# description    : This file contains my zsh configurations
# author         : Adi Iyengar
# username       : aditya7iyengar
# date_created   : 2017-02-01
# version        : 0.9
# usage		 : link/move to ~/.zshrc
# notes          : This adds a simple zsh shell configuration
# versions       : Tmux 2.x, Zsh 5.x
#==============================================================================

# Path to oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Use powerline
USE_POWERLINE="true"

# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi

# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

LIBRARY_PATH=:/usr/local/opt/openssl/lib/

if [[ -e ./.zshrcs/exports ]]; then
  source ./.zshrcs/exports
fi

if [[ -e ./.zshrcs/aliases ]]; then
  source ./.zshrcs/aliases
fi

if [[ -e ./.zshrcs/secrets ]]; then
  source ./.zshrcs/secrets
fi

if [[ -e ./.zshrcs/asdf ]]; then
  source ./.zshrcs/asdf
fi

if [[ -e ./.zshrcs/asdf.elixir ]]; then
  source ./.zshrcs/asdf.elixir
fi

if [[ -e ./.zshrcs/asdf.rust ]]; then
  source ./.zshrcs/asdf.rust
fi

if [[ -e ./.zshrcs/asdf.ruby ]]; then
  source ./.zshrcs/asdf.ruby
fi

if [[ -e ./.zshrcs/asdf.go ]]; then
  source ./.zshrcs/asdf.go
fi

if [[ -e ./.zshrcs/asdf.direnv ]]; then
  source ./.zshrcs/asdf.direnv
fi

if [[ -e ./.zshrcs/asdf.nvim ]]; then
  source ./.zshrcs/asdf.nvim
fi

if [[ -e ./.zshrc/fasd ]]; then
  source ./.zshrc/fasd
fi
