autoload -U colors && colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*' formats "%{$fg[blue]%}%s%{$fg[red]%} %b%{$reset_color%} %u"

precmd() {vcs_info}
setopt prompt_subst
export PROMPT="%{$fg[yellow]%}λ(%m)%{$fg[green]%} %c%{$fg[yellow]%} → \${vcs_info_msg_0_} %{$reset_color%}"
# setopt prompt_subst
# PROMPT='${vcs_info_msg_0_}%# '
