unsetopt beep			# I don't like beeps
setopt extendedglob		# Nice fancy globbing

bindkey '^K' kill-whole-line
bindkey "^R" history-incremental-search-backward
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
