# No colour support on OpenBSD ls
if [[ `uname -s` != "OpenBSD" ]]; then
	alias ls='ls -G'
fi

# A virtualenv is required in order to install python packages (see export
# PIP_REQUIRE_VIRTUALENV above), but sometimes I want to install or upgrade
# global packages. That's where I use gpip.
alias gpip='PIP_REQUIRE_VIRTUALENV="" pip'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias cdrkh='cd ~/Documents/Skola/RKH'
alias cdshh='cd ~/Documents/Skola/SHH'
alias cddr='cd ~/Documents/Skola/SHH/@Drafts'
alias cdfir='cd ~/Documents/Firma/'

# Spell checking
alias svspell='aspell -l sv check'
alias ukspell='aspell -l en check'
alias svtexspell='aspell -l sv -t check'
alias uktexspell='aspell -l en -t check'

alias t='todo.sh'
alias vitodo='vim ~/Dropbox/todo/todo.txt'

# Rename
alias spacetodash="rename 's,\s,_,g'"
alias lowercase='rename -fc'

# Rsync
alias srsync='rsync -zPe ssh'
alias pullcapiohome='rsync -arP --delete-after /Volumes/ncsvakva /Users/sjk/Documents/Capio'
alias pullcapiocommon='rsync -arP --delete-after /Volumes/COMMONGER\$ /Users/sjk/Documents/Capio'
alias pushcapiohome="rsync -arP --delete-after /Users/sjk/Documents/Capio/ncsvakva /Volumes"

alias burniso='cdrecord -v -eject dev=1,0,0'

alias thesession='timidity ~/Downloads/*.mid(Nm0om[1])'

alias mux=tmuxinator

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
fi

# Make the Terminal icon bounce. Sometimes useful, like:
# execute_timey_wimey_command && termbounce
# Then minimize terminal and it'll bounce when done.
alias termbounce='tput bel'

# Extention aliases!
alias -s {avi,flv,mpg,mpeg,wmv,mp4,mov,mkv}=/Applications/VLC.app/Contents/MacOS/VLC
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

eval "$(hub alias -s)"