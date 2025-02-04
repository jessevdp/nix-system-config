# Edit current command in $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line

bindkey -M viins '^v' edit-command-line
bindkey -M vicmd '^v' edit-command-line
bindkey -M visual '^v' edit-command-line

# Emulate the vim 'cmdwin'
bindkey -M vicmd 'q:' edit-command-line # to mirror "edit Ex command-line"
bindkey -M viins '^f' edit-command-line # to mirror 'cedit'
