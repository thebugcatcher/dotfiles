# My Dotfiles

These are my public dotfiles. The `installer` script works by pulling
these dotfiles and sym-linking them to appropriate places. Any file that was
overwritten by symlinking is moved to it's `<previous-name>.pre-dotfiles` path.

## Requirements

- Zsh
- Oh My Zsh
- Tmux
- NeoVim
- Ruby
- Python3

## Usage

The best way to copy these configurations is to use the installer script.

```
$ bash <(wget -qO- https://raw.githubusercontent.com/aditya7iyengar/dotfiles/master/installer.sh)

OR

$ bash <(curl -s https://raw.githubusercontent.com/aditya7iyengar/dotfiles/master/installer.sh)
```

### With Custom Repo

If you want to override or add to any of the functionalities in my dotfiles,
you can use a custom repo (could be private) using [this template repo](https://github.com/aditya7iyengar/dotfiles.custom-template)

Your custom configurations will be added to these configurations if you use
the following methods:

#### Remote git repo

To use a custom repo provide `CUSTOM_REPO_URL` environment variable while
running the above script.

```
$ CUSTOM_REPO_URL=https://github.com/user/dotfiles.custom \
  bash <(curl -s https://raw.githubusercontent.com/aditya7iyengar/dotfiles/master/installer.sh)
```

#### Local directory

To use a local custom dotfiles directory provide `CUSTOM_LOCAL_PATH` environment 
variable while running the above script.

```
$ CUSTOM_REPO_URL=/user/Documents/dotfiles.custom \
  bash <(curl -s https://raw.githubusercontent.com/aditya7iyengar/dotfiles/master/installer.sh)
```
