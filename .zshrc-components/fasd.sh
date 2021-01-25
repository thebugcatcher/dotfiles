#==============================================================================
# title          : .zshrc-components/fasd.sh
# description    : This file contains my zsh configurations for usage with fasd
# author         : Adi Iyengar
# username       : aditya7iyengar
# date_created   : 2017-02-01
# version        : 0.9
# usage          : link/move to ~/.zshrc-components/fasd.sh
# notes          : This adds a zsh config for fasd
# versions       : Tmux 2.x, Zsh 5.x
#==============================================================================

# Fasd Init
eval "$(fasd --init auto)"

# only init if installed.
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)" >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# jump to recently used items
alias a='fasd -a' # any
alias s='fasd -si' # show / search / select
alias d='fasd -d' # directory
alias f='fasd -f' # file
alias z='fasd_cd -d' # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # interactive directory jump
alias fv='f -e vim' # quick opening files with vim
alias fo='a -e xdg-open' # quick opening files with xdg-open
