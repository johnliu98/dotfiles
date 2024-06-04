#!/bin/sh

# --- General Aliases ----

# movement
alias ge="cd ~/go/src/github.com/einride"
alias gea="cd ~/go/src/github.com/einride-autonomous/ads/services/ad"
alias ges="cd ~/go/src/github.com/einride/simian-adapter"

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

# python
alias p="python"

# --- Git Aliases ---
alias ga="git add"
alias gC="git commit"
alias gCa="git commit --amend"
alias gCan="git commit --amend --no-edit"
alias gp="git pull -p"
alias gP="git push"
alias gPf="git push --force-with-lease --force-if-includes"
alias gc="git checkout"
alias gcm="git checkout master"
alias gs="git status"
alias gl="git log --stat"
alias glog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gd="git diff"
alias gdc="git diff --cached"
alias gb="git branch"
alias gr="git reset"
alias gM="git merge"
alias gR="git rebase"

# dependabot PRs
alias db="gh dependabot -t einride/team-motion-control"

# wireguard
alias wg="sudo wg-quick up client_00044"
