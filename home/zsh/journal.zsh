export JOURNAL=$HOME/Nextcloud/Documents/Notes/Journal
alias today='mkdir -p $JOURNAL/$(date +"%Y/%m") && $EDITOR $JOURNAL/$(date +"%Y/%m/%Y-%m-%d.md")'
alias yesterday='mkdir -p $JOURNAL/$(date -d yesterday +"%Y/%m") && $EDITOR $JOURNAL/$(date -d yesterday +"%Y/%m/%Y-%m-%d.md")'
