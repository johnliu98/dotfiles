#!/bin/sh

# --- General Aliases ----

# movement
alias ge="cd ~/einride"
alias gea="cd ~/einride/ads/services/ad"
alias ges="cd ~/einride/simian-adapter"
alias ads="cd ~/einride/ads"
alias gep="cd ~/einride/ads/services/pod-fusion-service"
alias gev="cd ~/einride/vehicle-control"

# listing
alias ls='ls -hN --color=auto --group-directories-first'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# storage
alias df='df -h'
alias du='du -h'
alias free='free -h'

# neovim
alias v="nvim"

# vpn
alias vpn="sudo openvpn --config $VPN_CONFIG"

# python
alias p="python3"

# --- Git Aliases ---
alias ga="git add"
alias gap="git add --patch"
alias gC="git commit -v"
alias gCa="git commit --amend"
alias gCan="git commit --amend --no-edit"
alias gp="git pull -p"
alias gP="git push"
alias gPf="git push --force-with-lease --force-if-includes"
alias gc="git checkout"
alias gcm="git checkout master"
alias gs="git status --short"
alias gl="git log --stat"
alias glo="git log --oneline"
alias glog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gd="git diff"
alias gdc="git diff --cached"
alias gb="git branch"
alias gr="git reset"
alias gM="git merge"
alias gR="git rebase"
alias gS="git stash"
alias gSp="git stash pop"

function gbc() {
    git fetch -p
    branches=$(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" { sub("refs/heads/", "", $1); print $1}')
    for branch in $branches; do
    git branch -D $branch;
done
}


# wireguard
alias wg="sudo wg-quick up client_00044"

# jama
function jama-id() {
    cat ${XDG_CACHE_HOME}/jama/id
}

function jama-secret() {
    cat ${XDG_CACHE_HOME}/jama/secret
}

function github-token() {
    cat ${XDG_CACHE_HOME}/github/token
}

export GITHUB_TOKEN=$(github-token)
