#==============================================================================
# title          : .zshrc-components/asdf.ruby.sh
# description    : This file contains my zsh configurations for asdf ruby
# author         : Adi Iyengar
# username       : aditya7iyengar
# date_created   : 2020-01-11
# version        : 0.9
# usage          : link/move to ~/.zshrc-components/asdf.ruby.sh
# notes          : This adds a zsh config for asdf ruby
# versions       : Tmux 2.x, Zsh 5.x
#==============================================================================

# Runs tests that have changes in current branch as compared to master/develop
ruby_diff_test() {
  branch=$1

  if [ -z "$branch" ]; then
    files=git diff --name-only --diff-filter=A develop HEAD .
  else
    files=git diff --name-only --diff-filter=A $branch HEAD .
  fi

  bin/rspec $($files | grep _spec.rb | tr '\r\n' ' ')
}
