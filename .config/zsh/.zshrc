#!/bin/sh

# some useful options (man zshoptions)
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

# Normal files to source
[ -f "${ZDOTDIR}/exports.zsh" ] && source "${ZDOTDIR}/exports.zsh"
[ -f "${ZDOTDIR}/aliases.zsh" ] && source "${ZDOTDIR}/aliases.zsh"

# completions
autoload -Uz compinit -d ${XDG_CACHE_HOME:-${HOME}/.cache}/zsh/zcompdump-$ZSH_VERSION
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:z:*' fzf-preview 'ls -hN --color --group-directories-first $realpath'

# Completion files: Use XDG dirs
[ -d "${XDG_CACHE_HOME:-${HOME}/.cache}"/zsh ] || mkdir -p "${XDG_CACHE_HOME:-${HOME}/.cache}"/zsh
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-${HOME}/.cache}"/zsh/zcompcache
compinit -d "${XDG_CACHE_HOME:-${HOME}/.cache}"/zsh/zcompdump-$ZSH_VERSION

# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
# compinit
_comp_options+=(globdots)		# Include hidden files.

[ -f "${ZDOTDIR}/vi.zsh" ] && source "${ZDOTDIR}/vi.zsh"

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# Useful Functions
source "$ZDOTDIR/functions.zsh"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_plugin "Aloxaf/fzf-tab"
zsh_add_completion "zsh-users/zsh-completions" true
# For more plugins: https://github.com/unixorn/awesome-zsh-plugins
# More completions https://github.com/zsh-users/zsh-completions

# FZF 
# [ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
# [ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
# [ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
# [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# [ -f $ZDOTDIR/completion/_fnm ] && fpath+="$ZDOTDIR/completion/"
# export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
# export FZF_DEFAULT_COMMAND="find . -type f"

# Unbind keys
bindkey -r "^u"
bindkey -r "^d"
bindkey -r "^[,"
bindkey -r "^[/"
bindkey -r "^[OA"
bindkey -r "^[OB"
bindkey -r "^[OC"
bindkey -r "^[OD"
bindkey -r "^[[A"
bindkey -r "^[[B"
bindkey -r "^[[C"
bindkey -r "^[[D"
bindkey -r "^[[P"
bindkey -r "^[c"
bindkey -r "^[~"

# Key-bindings
bindkey -s '^f' 'zi^M'
bindkey -s '^s' 'ncdu^M'
bindkey -s '^v' 'fzf | xargs -r nvim^M'
bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down
bindkey "^h" fzf-history-widget
bindkey '^[[P' delete-char

# Transient prompt
zle-line-init() {
        emulate -L zsh

        [[ $CONTEXT == start ]] || return 0

        while true; do
        zle .recursive-edit
        local -i ret=$?
        [[ $ret == 0 && $KEYS == $'\4' ]] || break
        [[ -o ignore_eof ]] || exit 0
        done

        local saved_prompt=$PROMPT
        local saved_rprompt=$RPROMPT
        PROMPT='%{%} ➜%{%} %'
        RPROMPT=''
        zle .reset-prompt
        PROMPT=$saved_prompt
        RPROMPT=$saved_rprompt

        if (( ret )); then
        zle .send-break
        else
        zle .accept-line
        fi
        return ret
}
zle -N zle-line-init

# Load system information
pfetch
