function virtualenv_info(){
  if [[ -n $VIRTUAL_ENV ]]; then
    echo "%{$fg_bold[blue]%}(%{$fg_bold[yellow]%}${${VIRTUAL_ENV}:t}%{$fg_bold[blue]%})%{$reset_color%}"
  fi
}

# Disable prompt mangling in virtual_env/bin/activate.
export VIRTUAL_ENV_DISABLE_PROMPT=1

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='
%{$fg[cyan]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}
%{$fg[white]%}%* ${ret_status} %{$reset_color%}'

RPROMPT='$(virtualenv_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
