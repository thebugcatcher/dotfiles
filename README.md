# My Dotfiles

These are my public dotfiles. The `installer` script works by pulling
these dotfiles and sym-linking them to appropriate places. Any file that was
overwritten by symlinking is moved to it's `<previous-name>.pre-dotfiles` path.

## Features

- Zsh
- Oh My Zsh
- NeoVim
- Elixir
- Rust
- Haskell
- Ruby
- Go
- JavaScript

## Usage

The best way to copy these configurations is to use the installer script.

```
$ bash <(wget -qO- https://raw.githubusercontent.com/aditya7iyengar/dotfiles/master/installer.sh)

OR

$ bash <(curl -s https://raw.githubusercontent.com/aditya7iyengar/dotfiles/master/installer.sh)
```

### With Custom Repo

If you want to override or add to any of the functionalities in my dotfiles,
you can use a custom repo (could be private) structured like [this repo](todo)

To use a custom repo provide `CUSTOM_REPO_URL` environment variable while
running the above script.

```
$ CUSTOM_REPO_URL=git@github.com/user/repo \
  bash <(curl -s https://raw.githubusercontent.com/aditya7iyengar/dotfiles/master/installer.sh)
```

Your custom configurations will be added to these configurations

