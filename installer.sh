#!/usr/bin/env bash

#==============================================================================
# title          : installer.sh
# description    : Installer script for these configurations
# author         : Adi Iyengar
# username       : aditya7iyengar
# date_created   : 2017-02-01
# version        : 0.9
# usage          : $ bash <filename or wget url>
# notes          : This scripts installs tools for these configurations
# versions       : Tmux 2.x, Zsh 5.x
#==============================================================================

REPO_URL="https://github.com/aditya7iyengar/dotfiles"

# path where dotfiles will be cloned
DOTFILES_PATH="$HOME/.dotfiles"

# path where custom dotfiles will be cloned
DOTFILES_CUSTOM_PATH="$HOME/.dotfiles.custom"

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

# Clone custom repo
clone_custom_repo() {
  _print_step "Cloning Custom Repo"

  if [[ -z $CUSTOM_REPO_URL ]]; then
    git clone $CUSTOM_REPO_URL $DOTFILES_CUSTOM_PATH
  else
    echo "No $CUSTOM_REPO_URL given"
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

  destination_directory="$HOME/.zshrc-components"
  source_directory="$DOTFILES_PATH/.zshrc-components"

  # Preserve previous $HOME/.zshrc-components directory if it exists
  if [[ -e $destination_directory ]]; then
    mv $destination_directory "${destination_directory}.pre-dotfiles"
  fi

  # Create $HOME/.zsh directory
  mkdir $destination_directory

  _symlink $source_directory/exports.sh $destination_directory/exports.sh
  _symlink $source_directory/aliases.sh $destination_directory/aliases.sh

  # Custom
  if [[ -z $CUSTOM_REPO_URL ]]; then
    _symlink $DOTFILES_CUSTOM_PATH/.zshrc-components/custom.sh $destination_directory/custom.sh
  fi

  # Languages & Tools
  _symlink $source_directory/asdf.sh $destination_directory/asdf.sh
  _symlink $source_directory/asdf.elixir.sh $destination_directory/asdf.elixir.sh
  _symlink $source_directory/asdf.rust.sh $destination_directory/asdf.rust.sh
  _symlink $source_directory/asdf.ruby.sh $destination_directory/asdf.ruby.sh
  _symlink $source_directory/asdf.go.sh $destination_directory/asdf.go.sh
  _symlink $source_directory/asdf.direnv.sh $destination_directory/asdf.direnv.sh
  _symlink $source_directory/asdf.nvim.sh $destination_directory/asdf.nvim.sh
  _symlink $source_directory/fasd.sh $destination_directory/fasd.sh
}

_symlink_nvim_files() {
  _symlink $DOTFILES_PATH/.vimrc $HOME/.vimrc

  destination_directory="$HOME/.vimrc-components"
  source_directory="$DOTFILES_PATH/.vimrc-components"

  # Preserve previous $HOME/.vimrc-components directory if it exists
  if [[ -e $destination_directory ]]; then
    mv $destination_directory "${destination_directory}.pre-dotfiles"
  fi

  # Create $HOME/.zsh directory
  mkdir $destination_directory

  # General Vim Config
  _symlink $source_directory/gen-config.vim $destination_directory/gen-config.vim

  # Custom Vim
  if [[ -z $CUSTOM_REPO_URL ]]; then
    _symlink $DOTFILES_CUSTOM_PATH/.vimrc-components/custom.vim $destination_directory/custom.vim
  fi

  # Vundle (Plugin Manager)
  _symlink $source_directory/vundle.vim $destination_directory/vundle.vim

  # Languages
  _symlink $source_directory/languages.vim $destination_directory/languages.vim

  # Functions and Mappings
  _symlink $source_directory/mappings.vim $destination_directory/mappings.vim

  # Update system neovim to use vim config
  _symlink $DOTFILES_PATH/.config/nvim/init.vim $HOME/.config/nvim/init.vim
}

# Creates symbolic link for .tmux.conf file
_symlink_tmux_files() {
  _symlink $DOTFILES_PATH/.tmux.conf $HOME/.tmux.conf
}

_symlink_git_files() {
  # User specific git configs
  if [[ -z $CUSTOM_REPO_URL ]]; then
    _symlink $DOTFILES_CUSTOM_PATH/.gitconfig $HOME/.gitconfig
    _symlink $DOTFILES_CUSTOM_PATH/.git-components/commit-template $HOME/.git-components/commit-template
    _symlink $DOTFILES_CUSTOM_PATH/.git-components/.gitignore $HOME/.git-components/.gitignore
  fi
}

_install_vundle() {
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
}

# Creates symbolic link for all dotfiles to function
symlink_files() {
  _print_step "Linking ZSH files"

  _symlink_zsh_files

  _print_step "Linking NeoVim files"

  _symlink_nvim_files

  _print_step "Installing Vundle"

  _install_vundle

  _print_step "Linking Tmux files"

  _symlink_tmux_files

  _print_step "Linking Git files"

  _symlink_git_files
}

# Main interface for this script
main() {
  clone_repo
  install_oh_my_zsh
  clone_custom_repo
  symlink_files
}

main
