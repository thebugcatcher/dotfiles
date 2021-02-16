#==============================================================================
# title          : .zshrc-components/asdf.go.sh
# description    : This file contains my zsh configurations for asdf go
# author         : Adi Iyengar
# username       : aditya7iyengar
# date_created   : 2020-01-11
# version        : 0.9
# usage          : link/move to ~/.zshrc-components/asdf.go.sh
# notes          : This adds a zsh config for asdf go
# versions       : Tmux 2.x, Zsh 5.x
#==============================================================================

if [[ -e /usr/local/go/bin ]]; then
  export PATH=$PATH:/usr/local/go/bin
fi

if command -v go &> /dev/null; then
  if [[ -e $(go env GOPATH) ]]; then
    export GOPATH=$(go env GOPATH)
  fi

  if [[ -e $(go env GOPATH)/bin ]]; then
    export PATH=$PATH:$(go env GOPATH)/bin
  fi
fi
