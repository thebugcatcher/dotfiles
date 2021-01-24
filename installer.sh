#!/usr/bin/env bash
#==============================================================================
# title          : installer.sh
# description    : Installer script for these configurations
# author         : Adi Iyengar
# username       : aditya7iyengar
# date_created   : 2017-02-01
# version        : 0.9
# usage		 : $ bash <filename or wget url>
# notes          : This scripts installs tools for these configurations
# versions       : Tmux 2.x, Zsh 5.x
#==============================================================================

REPO_URL="https://github.com/aditya7iyengar/dotfiles"
DOTFILES_PATH="$HOME/.dotfiles"
DOTFILES_SECRETS_PATH="$HOME/.dotfiles.secrets"

# Prints main steps of this installer
_print_step() {
  echo -e """
==========================================================
$1..
==========================================================
"""
}

# Git clone configurations
clone_repo() {
  _print_step "Cloning Repo"
  git clone $REPO_URL $DOTFILES_PATH
}

# Clone secrets repo
clone_secrets_repo() {
  _print_step "Cloning Secrets Repo"
  if [[ -z $SECRETS_REPO_URL ]]; then
    git clone $SECRETS_REPO_URL $DOTFILES_SECRETS_PATH
  else
    echo "No $SECRETS_REPO_URL given"
  fi
}

# Installs Oh my zsh
install_oh_my_zsh() {
  _print_step "Installing Oh My Zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

# Creates a symbolic link from source to destination
# Preserves old version of destination pre installation process with a suffix `.pre-dotfiles`
_symlink() {
  source_path=$1
  destination_path=$2

  # Link only if source path exists
  if [[ -e $source_path ]]; then
    # Preserve dotfiles pre installation process
    if [[ -e $destination_path ]]; then
      mv $destination_path "${destination_path}.pre-dotfiles"
    fi 

    ln -sf $source_path $destination_path
  fi
}

# Creates symbolic links for all zsh files
_symlink_zsh_files() {
  _symlink $DOTFILES_PATH/.zshrc $HOME/.zshrc

  destination_directory="$HOME/.zshrcs"
  source_directory="$HOME/.zshrcs"

  # Preserve previous $HOME/.zshrcs directory if it exists
  if [[ -e $destination_directory ]]; then
    mv $destination_directory "${destination_directory}.pre-dotfiles"
  fi

  # Create $HOME/.zsh directory
  mkdir $destination_directory

  _symlink $source_directory/exports $destination_directory/exports
  _symlink $source_directory/aliases $destination_directory/aliases

  if [[ -z $SECRETS_REPO_URL ]]; then
    _symlink $DOTFILES_SECRETS_PATH/.zsh/secrets $destination_directory/secrets
  fi

  # Languages & Tools
  _symlink $source_directory/asdf $destination_directory/asdf
  _symlink $source_directory/asdf.elixir $destination_directory/asdf.elixir
  _symlink $source_directory/asdf.rust $destination_directory/asdf.rust
  _symlink $source_directory/asdf.ruby $destination_directory/asdf.ruby
  _symlink $source_directory/asdf.go $destination_directory/asdf.go
  _symlink $source_directory/asdf.direnv $destination_directory/asdf.direnv
  _symlink $source_directory/asdf.nvim $destination_directory/asdf.nvim
  _symlink $source_directory/fasd $destination_directory/fasd
}

_symlink_nvim_files() {
  _symlink $DOTFILES_PATH/.vimrc $HOME/.vimrc
  _symlink $DOTFILES_PATH/.vimrcs/gen-config $HOME/.vimrcs/gen-config

  # Vundle (Plugin Manager)
  _symlink $DOTFILES_PATH/.vimrcs/vundle $HOME/.vimrcs/vundle

  # General plugins
  _symlink $DOTFILES_PATH/.vimrcs/gen-plugins $HOME/.vimrcs/gen-plugins

  # Languages
  _symlink $DOTFILES_PATH/.vimrcs/elixir $HOME/.vimrcs/elixir
  _symlink $DOTFILES_PATH/.vimrcs/rust $HOME/.vimrcs/rust
  _symlink $DOTFILES_PATH/.vimrcs/haskell $HOME/.vimrcs/haskell
  _symlink $DOTFILES_PATH/.vimrcs/ruby $HOME/.vimrcs/ruby
  _symlink $DOTFILES_PATH/.vimrcs/go $HOME/.vimrcs/go

  # Functions and Mappings
  _symlink $DOTFILES_PATH/.vimrcs/functions $HOME/.vimrcs/functions
  _symlink $DOTFILES_PATH/.vimrcs/mappings $HOME/.vimrcs/mappings

  # Update system neovim to use vim config
  _symlink $DOTFILES_PATH/nvim/init.vim $HOME/.config/nvim/init.vim
}

# Creates symbolic link for all dotfiles to function
symlink_files() {
  _print_step "Linking ZSH files"  
  _symlink_zsh_files

  _print_step "Linking NeoVim files"
  _symlink_nvim_files
}

# Main interface for this script
main() {
  clone_repo
  install_oh_my_zsh
  clone_secrets_repo
  symlink_files
}

main
