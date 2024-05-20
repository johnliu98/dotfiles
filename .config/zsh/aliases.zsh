#!/bin/sh

# --- General Aliases ----

# movement
alias ge="cd ~/go/src/github.com/einride-autonomous/ads/"
alias gea="cd ~/go/src/github.com/einride-autonomous/ads/services/ad/"
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

# --- Git Aliases ---
#alias ga='git add'
#alias gC='git commit'
#alias gp='git pull'
#alias gP='git push'
#alias gc='git checkout'
#alias gs='git status'
#alias gl='git log --graph --oneline --decorate'
#alias gd='git diff'
#alias gb='git branch'
#alias gr='git reset'
#alias gM='git merge'
#alias gR='git rebase'

# --- Other Aliases ---
# alias gdrive='gdrive --config $XDG_DATA_HOME/gdrive'

# --- Shortcuts for system paths ---
# bindkey -s 'gh' '/home/john^M'
# bindkey -s 'gcf' '/home/john/.config^M'
# bindkey -s 'gca' '/home/john/.cache^M'
# bindkey -s 'gbi' '/home/john/.local/bin^M'
# bindkey -s 'gsh' '/home/john/.local/share^M'
# bindkey -s 'gdo' '/home/john/Documents^M'
# bindkey -s 'gdl' '/home/john/Downloads^M'
# bindkey -s 'gpi' '/home/john/Pictures^M'
# bindkey -s 'gcco' '/home/john/.config/compton^M'
# bindkey -s 'gccn' '/home/john/.config/conky^M'
# bindkey -s 'gcdm' '/home/john/.config/dmenu^M'
# bindkey -s 'gcdu' '/home/john/.config/dunst^M'
# bindkey -s 'gcdw' '/home/john/.config/dwm^M'
# bindkey -s 'gcdb' '/home/john/.config/dwmblocks^M'
# bindkey -s 'gcnv' '/home/john/.config/nvim^M'
# bindkey -s 'gcra' '/home/john/.config/ranger^M'
# bindkey -s 'gcst' '/home/john/.config/st^M'
# bindkey -s 'gcxo' '/home/john/.config/X11^M'
# bindkey -s 'gcza' '/home/john/.config/zathura^M'
# bindkey -s 'gczs' '/home/john/.config/zsh^M'
# bindkey -s 'gbco' '/home/john/.local/bin/color-scripts^M'
# bindkey -s 'gbdm' '/home/john/.local/bin/dmenu^M'
# bindkey -s 'gbst' '/home/john/.local/bin/statusbar^M'
# bindkey -s 'gsdw' '/home/john/.local/share/dwm^M'
# bindkey -s 'gdkk' '/home/john/Documents/ktk-kassör^M'
# bindkey -s 'gdmt' '/home/john/Documents/master-thesis^M'
# bindkey -s 'gpas' '/home/john/Pictures/ascii^M'
# bindkey -s 'gpsc' '/home/john/Pictures/screenshots^M'
# bindkey -s 'gpwa' '/home/john/Pictures/wallpapers^M'
# bindkey -s 'gpwf' '/home/john/Pictures/wallpapers/favorites/^M'
