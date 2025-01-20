# Edit current command in $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^v' edit-command-line
