# https://github.com/zsh-users/zsh/blob/master/Functions/Zle/select-bracketed
autoload -U select-bracketed
zle -N select-bracketed

for mode in visual viopp; do
  for char in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $mode $char select-bracketed
  done
done

# https://github.com/zsh-users/zsh/blob/master/Functions/Zle/select-quoted
autoload -U select-quoted
zle -N select-quoted

for mode in visual viopp; do
  for char in {a,i}{\',\",\`}; do
    bindkey -M $mode $char select-quoted
  done
done
