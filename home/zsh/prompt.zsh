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

# add Taskwarrior
# TASK WARRIOR INTO MY PROMPT
# this part is just fun-with-utf8
# https://twitter.com/pjf/status/852466839145795584
# URGENT="2757"
# DUETOMORROW="2690"
# DUETODAY="2691"
# OVERDUE="2639"
# OK="2714"

# # shows if any TaskWarrior tasks are in need of attention
# function task_indicator {
#     if [ `task +READY +OVERDUE count` -gt "0" ]  ; then
#         printf "%b" "\u$OVERDUE"
#     elif [ `task +READY +DUETODAY count` -gt "0" ]  ; then
#         printf "%b" "\u$DUETODAY"
#     elif [ `task +READY +DUETomorrow count` -gt "0" ]  ; then
#         printf "%b" "\u$DUETOMORROW"
#     elif [ `task +READY urgency \> 10 count` -gt "0" ]  ; then
#         printf "%b" "\u$URGENT"
#     else
#         printf "%b" "\u$OK"
#     fi
# }


# From https://gist.github.com/pjf/051aa4ef326d493beec950823f7edfd8#file-bashrc
# if [ -f /usr/local/bin/task ]; then
#     TICK="✓"
#     CROSS="✗"

#     URGENT="❗"
#     OVERDUE="☠️"
#     DUETODAY="😱"
#     DUETOMORROW="📅"

#     function task_indicator {
#         if [ `task +READY +OVERDUE count` -gt "0" ]; then
#             echo "$OVERDUE"
#         elif [ `task +READY +DUETODAY count` -gt "0" ]; then
#             echo "$DUETODAY"
#         elif [ `task +READY +DUETOMORROW count` -gt "0" ]; then
#             echo "$DUETOMORROW"
#         elif [ `task +READY urgency \> 10 count` -gt "0" ]; then
#             echo "$URGENT"
#         else
#             echo '$'
#         fi
#     }


#     task="\$(task_indicator)"
#     addprompt=$task
#     PROMPT="$addprompt $PROMPT"
# fi
