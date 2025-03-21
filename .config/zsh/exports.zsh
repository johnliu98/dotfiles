#!/bin/sh

# Add xdg paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export XDG_RUNTIME_DIR="/run/user/$UID"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share:$XDG_DATA_DIRS"

# History
HISTFILE="${XDG_STATE_HOME}/zsh/history" 
[[ ! -d "${XDG_STATE_HOME}/zsh" ]] && mkdir -p "${XDG_STATE_HOME}/zsh"
HISTSIZE=1000000
HISTFILESIZE=$HISTSIZE
SAVEHIST=$HISTSIZE
HISTDUP=erase

export MANPAGER='nvim +Man!'
export MANWIDTH=999

# Color
export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.crdownload=00;90:*.dpkg-dist=00;90:*.dpkg-new=00;90:*.dpkg-old=00;90:*.dpkg-tmp=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:*.swp=00;90:*.tmp=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:"

# Software variables
export EDITOR="nvim"
export BROWSER="google-chrome-stable"

# Set Go variables
export GOROOT="/usr/local/go"
export GOPATH="$HOME/go"
export GOBIN="$HOME/go/bin"
export GOPRIVATE="github.com/einride/*,go.einride.tech/*,github.com/einride-autonomous/*"

# Export to PATH
export PATH="$PATH:${XDG_DATA_HOME}/cargo/bin"
export PATH="$PATH:${HOME}/.local/bin"
export PATH="$PATH:${GOROOT}/bin"
export PATH="$PATH:$GOBIN"
export PATH="$PATH:${XDG_DATA_HOME}/fnm"
export PATH="$PATH:${GOPATH}/src/github.com/balena-io/balena-cli"
export PATH="$PATH:${XDG_DATA_HOME}/npm/bin"
export PATH="$PATH:${XDG_DATA_HOME}/python/bin"

# Ansible
export ANSIBLE_HOME="$XDG_CONFIG_HOME/ansible"
export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible.cfg"
export ANSIBLE_GALAXY_CACHE_DIR="$XDG_CACHE_HOME/ansible/galaxy_cache"

# Cargo
export CARGO_HOME="$XDG_DATA_HOME/cargo"
[ -f "${XDG_DATA_HOME}/cargo/env" ] && . "${XDG_DATA_HOME}/cargo/env"

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME/docker-machine"

# GnuPG
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
[[ ! -d $GNUPGHOME ]] && mkdir -p $GNUPGHOME

# Google cloud
export CLOUDSDK_PYTHON="/usr/bin/python3"
# The next line updates PATH for the Google Cloud SDK.
[ -f "${XDG_DATA_HOME}/google-cloud-sdk/path.zsh.inc" ] && . "${XDG_DATA_HOME}/google-cloud-sdk/path.zsh.inc"
# The next line enables shell command completion for gcloud.
[ -f "${XDG_DATA_HOME}/google-cloud-sdk/completion.zsh.inc" ] && . "${XDG_DATA_HOME}/google-cloud-sdk/completion.zsh.inc"


# Ivex
export IVEX_USER=john
export IVEX_PASSWORD=s@ferPOD2022!

#Java
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

# Node
export NODE_PATH="$XDG_DATA_HOME"/node_modules

# NPM
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

# Password store
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass

# Python
export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME/python"
export PYTHONUSERBASE="$XDG_DATA_HOME/python"
export PYTHON_HISTORY="$XDG_STATE_HOME/python/history" && mkdir -p "$XDG_STATE_HOME/python"

# Python environment
export PYENV_ROOT="${XDG_DATA_HOME}/pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Rust
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

# Starship
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export STARSHIP_CACHE="$XDG_CACHE_HOME/starhip"

# Visual Studio Code
export VSCODE_PORTABLE="$XDG_DATA_HOME/vscode"

# VPN
export VPN_CONFIG="$XDG_DATA_HOME/john.liu.conf"

# WGET
export WGETRC="$XDG_CONFIG_HOME/wgetrc"

# Zinit
ZINIT_HOME="${XDG_DATA_HOME}/zinit/zinit.git"

# Export gpg tty
export GPG_TTY=$(tty)

# Add path to alcritty completions.
fpath+=${ZDOTDIR:-~}
