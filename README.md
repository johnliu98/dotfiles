# My `.`-files

This directory contains the dotfiles for my system.

## Requirements

Enture you have the following install on your system.

### Git

```sh
sudo apt update && sudo apt upgrade
sudo apt install git
```

### Stow

```sh
curl https://ftp.gnu.org/gnu/stow/stow-latest.tar.gz --output stow.tar.gz
tar -xvpzf stow.tar.gz
cd stow-<version>
./configure && sudo make install
```

## Installation

First, clone the dotfiles repository in $HOME directory

```sh
git clone git@github.com:johnliu98/dotfiles.git "${HOME}/dotfiles"
cd ~/dotfiles
```

then use GNU stow to create symlinks

```sh
stow --adopt .
```
