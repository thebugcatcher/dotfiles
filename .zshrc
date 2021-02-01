#==============================================================================
# title          : .zshrc
# description    : This file contains my zsh configurations
# author         : Adi Iyengar
# username       : aditya7iyengar
# date_created   : 2017-02-01
# version        : 0.9
# usage          : link/move to ~/.zshrc
# notes          : This adds a simple zsh shell configuration
# versions       : Tmux 2.x, Zsh 5.x
#==============================================================================

# Check OS
kernel="`uname`"

case $kernel in
  'Linux')
    export DOTFILES_OS='linux'
  ;;
  'Darwin')
    export DOTFILES_OS='osx'
  ;;
esac


# Path to oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"

plugins=(git)

source $ZSH/oh-my-zsh.sh

LIBRARY_PATH=:/usr/local/opt/openssl/lib/

if [[ -e ./.zshrc-components/exports.sh ]]; then
  source ./.zshrc-components/exports.sh
fi

if [[ -e ./.zshrc-components/aliases.sh ]]; then
  source ./.zshrc-components/aliases.sh
fi

if [[ -e ./.zshrc-components/asdf.sh ]]; then
  source ./.zshrc-components/asdf.sh
fi

if [[ -e ./.zshrc-components/asdf.elixir.sh ]]; then
  source ./.zshrc-components/asdf.elixir.sh
fi

if [[ -e ./.zshrc-components/asdf.rust.sh ]]; then
  source ./.zshrc-components/asdf.rust.sh
fi

if [[ -e ./.zshrc-components/asdf.ruby.sh ]]; then
  source ./.zshrc-components/asdf.ruby.sh
fi

if [[ -e ./.zshrc-components/asdf.go.sh ]]; then
  source ./.zshrc-components/asdf.go.sh
fi

if [[ -e ./.zshrc-components/asdf.haskell.sh ]]; then
  source ./.zshrc-components/asdf.haskell.sh
fi

if [[ -e ./.zshrc-components/asdf.direnv.sh ]]; then
  source ./.zshrc-components/asdf.direnv.sh
fi

if [[ -e ./.zshrc-components/asdf.nvim.sh ]]; then
  source ./.zshrc-components/asdf.nvim.sh
fi

if [[ -e ./.zshrc-components/fasd.sh ]]; then
  source ./.zshrc-components/fasd.sh
fi

if [[ -e ./.zshrc-components/custom.sh ]]; then
  source ./.zshrc-components/custom.sh
fi

if [ $DOTFILES_OS = "osx" ]; then
  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  # Initialization code that may require console input (password prompts, [y/n]
  # confirmations, etc.) must go above this block; everything else may go below.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi
