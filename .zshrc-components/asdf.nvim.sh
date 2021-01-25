#==============================================================================
# title          : .zshrc-components/asdf.nvim.sh
# description    : This file contains my zsh configurations for asdf nvim
# author         : Adi Iyengar
# username       : aditya7iyengar
# date_created   : 2020-01-11
# version        : 0.9
# usage          : link/move to ~/.zshrc-components/asdf.nvim.sh
# notes          : This adds a zsh config for asdf nvim
# versions       : Tmux 2.x, Zsh 5.x
#==============================================================================

# Love neovim, but I am used to the vim command
alias vim='nvim'

# vimrc editing
alias ve='vim ~/.vimrc'

# Opens last file edited in vim
alias vimp="vim -c \"normal '0\""

# Open all changed files in a git project using vim
alias vimch='vim -o $(gd --name-only)'

# zshrc editing
alias ze='vim ~/.zshrc'

# zshrc alias editing
alias ae='vim $HOME/.zshrc-components/aliases.sh'
