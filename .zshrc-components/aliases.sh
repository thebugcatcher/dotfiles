#==============================================================================
# title          : .zshrc-components/aliases.sh
# description    : This file contains my zsh aliases
# author         : Adi Iyengar
# username       : aditya7iyengar
# date_created   : 2017-02-01
# version        : 0.9
# usage          : link/move to ~/.zshrc-components/aliases.sh
# notes          : This adds zsh aliases
# versions       : Tmux 2.x, Zsh 5.x
#==============================================================================

#########################
## ONLY FOR ARCH LINUX ##
#########################

alias pacrepo='sudo reflector -l 20 -f 10 --save /etc/pacman.d/mirrorlist'
alias pacman='sudo pacman'
alias journalctl='sudo journalctl'
alias pacu='sudo pacman -Syu --noconfirm'
alias auru='yaourt -Syua --noconfirm'
alias systemctl='sudo systemctl'
alias se='ls /usr/bin | grep'

###############
## PROCESSES ##
###############

alias psa="ps aux"
alias psg="ps aux | grep "

#######################
## TERMINAL COMMANDS ##
#######################

alias ls='ls --color=auto'
alias cl="clear"
alias less='less -r'
alias tf='tail -f'
alias l='less'

# see the last modified files
alias lh='ls -alt | head'

# Show files matching "ls grep"
alias lsg='ll | grep'

# Tar zip
alias gz='tar -zcvf'

# Convert xclip to mac-like pbcopy
alias pbcopy="xclip -sel clip"

##################
## GIT COMMANDS ##
##################
alias gs='git status'
alias gst='git stash'
alias gsh='git show'
alias gci='git ci'
alias ga='git add -A'
alias gm='git merge'
alias gam='git amend --reset-author'
alias gr='git rebase'
alias gl='git l'
alias gf='git fetch'
alias gd='git diff'
alias gb='git b'
alias gp='git push'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gpsh='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias gpsuo='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias grs='git reset'
alias grsh='git reset --hard'
alias gbg='git bisect good'
alias gbb='git bisect bad'
alias gdmb='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

alias gfl='git flow'

alias gtop='cd $(git rev-parse --show-toplevel)'

# Lines of code using git
alias gitlines='git ls-files | xargs wc -l'

# List git authors
alias gitauthors='git log --format='%aN' | sort -u'

###################
## TMUX COMMANDS ##
###################
# For tmux move window
alias prev_tmux_window_number="""
num=$(tmux display-message -p '#I')
echo $((num - 1))
"""

###################
### SSH COMMANDS ##
###################
alias ssh='TERM=xterm ssh'

###############
## Sys-Admin ##
###############

# Usage: $ kill_all beam
kill_all() {
  match=$1
  if [ -z "$match" ]; then
    echo 'No argument given'
  else
    ps aux | grep -e $match | grep -v grep | tr -s ' ' | cut -d ' ' -f 2 | xargs kill -9
  fi
}
