if [ "$USER" = "root" ]; then CARETCOLOR="red"; else CARETCOLOR="magenta"; fi

local return_code="%(?..%{$fg_bold[red]%}:( %?%{$reset_color%})"

PROMPT='
%{$fg_bold[yellow]%}%n%{$reset_color%}%{$fg[yellow]%}:%{${fg_bold[green]}%}%~%{$reset_color%}$(git_prompt_info)
%{${fg[$CARETCOLOR]}%}%# %{${reset_color}%}'

RPS1='${return_code} %D - %*'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[magenta]%}@%{$reset_color%}%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%} ¯\_(ツ)_/¯"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} (╯°□°)╯︵ ┻━┻"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[red]%} ♪┏(♥o♥)┛♪"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[red]%} ヾ(⌐♥_♥)ノ♪ "
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[red]%} ヾ(⌐■_■)ノ♪ ♥"
