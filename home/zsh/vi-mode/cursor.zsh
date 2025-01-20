# Cursor styles - numbers represent the DECSCUSR cursor shape
# See: https://invisible-island.net/xterm/ctlseqs/ctlseqs.html#h4-Functions-using-CSI-_-ordered-by-the-final-character-lparen-s-rparen:CSI-Ps-SP-q.1D81
# For reference:
# 1/2: Blinking/Solid block
# 3/4: Blinking/Solid underscore
# 5/6: Blinking/Solid vertical bar
NORMAL_CURSOR=2
INSERT_CURSOR=6
VISUAL_CURSOR=1

# Change cursor shape for different vi modes
function zle-keymap-select {
  case ${KEYMAP} in
    vicmd)
      echo -ne "\e[$NORMAL_CURSOR q" # normal mode
      ;;
    vivis|vivli)
      echo -ne "\e[$VISUAL_CURSOR q" # visual mode
      ;;
    main|viins|*)
      echo -ne "\e[$INSERT_CURSOR q" # insert mode
      ;;
  esac
}
zle -N zle-keymap-select

# Ensure insert mode cursor when starting new prompt
function _fix_cursor() {
  echo -ne "\e[$INSERT_CURSOR q"
}
precmd_functions+=(_fix_cursor)

# Reset cursor style on zle startup
# Particularly useful if returning from an external editor
function zle-line-init() {
  echo -ne "\e[$INSERT_CURSOR q"
}
zle -N zle-line-init
