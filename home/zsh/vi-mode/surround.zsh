autoload -Uz surround

zle -N add-surround surround
zle -N change-surround surround
zle -N delete-surround surround

bindkey -a 'gsa' add-surround
bindkey -a 'gsd' delete-surround
bindkey -a 'gsr' change-surround
bindkey -v 'gsa' add-surround
