# No colour support on OpenBSD ls
if [[ `uname -s` != "OpenBSD" ]]; then
	alias ls='ls -G'
fi

alias lt=ls --human-readable --size -l -S --classify'

# A virtualenv is required in order to install python packages (see export
# PIP_REQUIRE_VIRTUALENV above), but sometimes I want to install or upgrade
# global packages. That's where I use gpip.
alias gpip='PIP_REQUIRE_VIRTUALENV="" pip'
alias gpip3='PIP_REQUIRE_VIRTUALENV="" pip3'

# git
alias add='git add'
alias gc='git clone'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias cdg='cd ~/Google\ Drive'
alias cdamb='cd ~/Documents/50-59\ Utbildning/54\ Ambulans'

# Spell checking
alias svspell='aspell -l sv check'
alias ukspell='aspell -l en check'
alias svtexspell='aspell -l sv -t check'
alias uktexspell='aspell -l en -t check'

# Rsync
alias srsync='rsync -zPe ssh'

# Brew
alias fetch-updates='brew update && brew fetch --deps --retry $(brew outdated |cut -f 1)'


alias thesession='timidity ~/Downloads/*.mid(Nm0om[1])'

alias mux=tmuxinator
alias tmuxs='tmux list-sessions'

# Reboot tomorrow morning at 02:30
# Gnu date has --date, but not the bsd version, so...
alias reboottonight='shutdown -r $(date -r $(expr $(date +%s) + 86400) "+%y%m%d0230")'

# Flush msmtp queue
alias goemail='msmtp-queue -r'

# Ansible
alias ave='EDITOR=nvim ansible-vault edit'
alias avv='ansible-vault view'
alias apl='ansible-playbook'

# OS X convenience aliases
if [[ `uname -s` == "Darwin" ]]; then
    alias pubkeycp='cat ~/.ssh/id_rsa.pub |pbcopy |echo "Public key copied to clipboard."'
    alias hibernateon='sudo pmset -a hibernatemode 5'
    alias hibernateoff='sudo pmset -a hibernatemode 0'
    alias lockmac='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
    alias stfu='osascript -e "set volume output muted true"'
    alias v1='osascript -e "set volume 1"'
    alias v3='osascript -e "set volume 3"'
    alias v5='osascript -e "set volume 5"'
    alias v7='osascript -e "set volume 7"'
    alias v9='osascript -e "set volume 9"'
    alias hidedesktop='defaults write com.apple.finder CreateDesktop -bool false && killall Finder'
    alias showdesktop='defaults write com.apple.finder CreateDesktop -bool true && killall Finder'
    alias flushdns='sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache'
fi

alias dpaste="curl -F 'format=url' -F 'content=<-' https://dpaste.org/api/"

# Make the Terminal icon bounce. Sometimes useful, like:
# execute_timey_wimey_command && termbounce
# Then minimize terminal and it'll bounce when done.
alias termbounce='tput bel'

# Extention aliases!
alias -s txt=vim
alias -s html=firefox
alias -s pdf=open
alias -s tar="tar xf"
alias -s gz="gunzip"
alias -s bz2="bunzip2"
alias -s tgz="tar zxvf"
alias -s tbz2="tar jxvf"
alias -s zip="unzip"

# Global aliases
alias -g D="~/Downloads/*(om[1])"
alias -g C="~/Code/"

alias op-signin='eval $(op signin my)'
alias op-logout='op signout && unset OP_SESSION_my'

if command -v hub 1>/dev/null 2>&1;
then
    eval "$(hub alias -s)"
fi

if command -v nvim 1>/dev/null 2>&1;
then
    alias vim='nvim'
fi
