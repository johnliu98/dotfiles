# zmodload zsh/zprof

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
[ -f "${ZDOTDIR}/vi.zsh" ] && source "${ZDOTDIR}/vi.zsh"

# Source zinit
if [ ! -f "${ZINIT_HOME}/zinit.zsh" ]; then
        mkdir -p "$(dirname $ZINIT_HOME)"
        git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit wait lucid for \
   hlissner/zsh-autopair \
   Aloxaf/fzf-tab \
   atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
      zdharma-continuum/fast-syntax-highlighting \
   blockf \
      zsh-users/zsh-completions \
   atload"!_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions

# Completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls -hN --color --group-directories-first $realpath'

# Key-bindings
bindkey -s '^f' 'zi^M'
bindkey -s '^v' 'fzf | xargs -r nvim^M'

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

        STATUS="➜"
        [ "$STARSHIP_CMD_STATUS" -eq "1" ] && STATUS="✖"
        PROMPT='%{%} $STATUS%{%} %'
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
fastfetch

# zprof
