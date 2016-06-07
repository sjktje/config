autoload -U colors && colors

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[red]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[red]%}›%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%}%{$fg[yellow]%}∗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$reset_color%}%{$fg[green]%}✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# get the name of the branch we are on
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# Checks if working tree is dirty
parse_git_dirty() {
  if [[ -n $(git status -s --ignore-submodules=dirty 2> /dev/null) ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}

autoload -U promptinit
promptinit
prompt elite2

if [ -n "${SSH_CLIENT+x}" ]; then
    PROMPT='%{$fg[green]%}(%n@%m) %2~ $(git_prompt_info)%{$reset_color%}%(?:%{$fg[blue]%}:$fg[red])%(!.#.%%) %{$reset_color%}'
else
    PROMPT='%{$fg[green]%}%2~ $(git_prompt_info)%{$reset_color%}%(?:%{$fg[blue]%}:$fg[red])%(!.#.%%) %{$reset_color%}'
fi
