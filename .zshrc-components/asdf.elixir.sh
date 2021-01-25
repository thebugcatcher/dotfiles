#==============================================================================
# title          : .zshrc-components/asdf.elixir.sh
# description    : This file contains my zsh configurations for asdf elixir
# author         : Adi Iyengar
# username       : aditya7iyengar
# date_created   : 2020-01-11
# version        : 0.9
# usage          : link/move to ~/.zshrc-components/asdf.elixir.sh
# notes          : This adds a zsh config for asdf elixir
# versions       : Tmux 2.x, Zsh 5.x
#==============================================================================

# Allows persistent shell history
export ERL_AFLAGS="-kernel shell_history enabled"

# To use IEx.open/2 in tmux
export ELIXIR_EDITOR="gnome-terminal -- tmux new nvim +__LINE__ __FILE__"

# Runs tests that have changes in current branch as compared to master/develop
elixir_diff_test() {
  branch=$1

  if [ -z "$branch" ]; then
    files=git diff --name-only --diff-filter=A develop HEAD .
  else
    files=git diff --name-only --diff-filter=A $branch HEAD .
  fi

  mix test $($files | grep _test.exs | tr '\r\n' ' ')
}
