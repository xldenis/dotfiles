autoload -U colors && colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' unstagedstr '* '
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*' formats "%{$fg[blue]%}%s%{$fg[red]%} %b %{$fg[yellow]%}%u"

precmd() {vcs_info}
setopt prompt_subst
export PROMPT="%{$fg[yellow]%}λ(%m)%{$fg[green]%} %c%{$fg[yellow]%} → \${vcs_info_msg_0_}%{$reset_color%}"
# setopt prompt_subst
# PROMPT='${vcs_info_msg_0_}%# '

function set-window-title {
   print -Pn "\e]0;%~\a"
}

set-window-title
add-zsh-hook precmd set-window-title
