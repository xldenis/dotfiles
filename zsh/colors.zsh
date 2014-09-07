export CLICOLOR=1;
LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"

export LS_COLORS

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
