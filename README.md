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

1. Download stow.

```sh
curl -sO https://ftp.gnu.org/gnu/stow/stow-latest.tar.gz
tar -xf stow-latest.tar.gz
```

2. Install Perl dependencies.

```sh
sudo cpan Test::Output
sudo cpan Test::More
```

3. Install Stow.

```sh
cd stow-<version>
./configure && sudo make install
```

## Installation

First, clone the dotfiles repository in $HOME directory

```sh
git clone git@github.com:johnliu98/dotfiles.git "${HOME}/dotfiles"
```

then use GNU stow to create symlinks

```sh
cd ~/dotfiles
ls .config | xargs -I % mkdir -p ~/.config/%
stow .
```
