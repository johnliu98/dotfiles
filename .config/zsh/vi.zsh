bindkey -v
export KEYTIMEOUT=5

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select

 # Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor when exiting neovim.
function _fix_cursor() {
    echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)
