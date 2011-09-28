export CVS_RSH=ssh
export EDITOR=vim
export LC_CTYPE=sv_SE.UTF-8
export TZ=CET
export HISTSIZE=13000
export SAVEHIST=12000
export HISTFILE=~/.history
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:$HOME/bin
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'
export TEXINPUTS=$TEXINPUTS:${HOME}/lib/LaTeX
export BLOCKTABLE="attackers"

if [[ -n "$ZSHRUN" ]]
then
  HISTFILE=~/.zrunhistory
elif [[ "$HINDI" = "" ]]
then
  HISTFILE=~/.history
else
  unset HISTFILE
  fc -R ~/.history
fi


if [[ `uname -s` == "OpenBSD" ]]; then
	export PKG_PATH="ftp://ftp.su.se/pub/OpenBSD/`uname -r`/packages/`uname -m`/"
	export CVSROOT=anoncvs@anoncvs.se.openbsd.org:/cvs
fi

if [[ `uname -n` != "krypton.local" && -z "$TMUX" && $USER != "root" ]]; then
	tmux attach || tmux new;
fi

alias srsync='rsync -zPe ssh'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# No colour support on OpenBSD ls
if [[ `uname -s` != "OpenBSD" ]]; then
	alias ls='ls -G'
fi

alias cdrkh='cd ~/Documents/Skola/RKH'
alias cdgit='cd /pub/git'
alias svspell='aspell -l sv check'
alias ukspell='aspell -l en check'
alias svtexspell='aspell -l sv -t check'
alias uktexspell='aspell -l en -t check'

alias syncsite=syncsite2
alias syncsite1='rsync -auzP --delete-after /Users/sjk/sjksite/ sjksite@82.103.130.62:htdocs/'
alias syncsite2='rsync -auzP --exclude=.git --exclude=config.php --delete-after /Users/sjk/sjksite/ sjk@shell.slashbox.net:sites/sjk.ankeborg.nu/'
alias syncsite3='rsync -auzP --delete-after /Users/sjk/sjksite/ sjksite@werther.log2x.nu:htdocs/'

alias syncbth='rsync -auzP --delete-after --exclude=.git /Users/sjk/bth/ svkv11@ssh.student.bth.se:www/'

alias syncrkh='rsync -auzP --delete-after /Users/sjk/Documents/Skola/RKH sjk@slashbox:.'
alias syncworkouts='rsync -auzP --delete-after /Users/sjk/Documents/workouts*.numbers sjk@slashbox:.'
alias syncrkhstick='rsync -rtvPL --modify-window=2 --delete-after /Users/sjk/Documents/Skola/RKH /Volumes/SJK\ RKH'
alias rsmirror='rsync --delete-after -azP'
alias syncmusic='rsync -rtvPL /Users/sjk/Music/iTunes/iTunes\ Music /Volumes/Nokia\ N900/'

alias bbackupquery='bbackupquery -c /usr/local/etc/box/clients/boxbackup.vanbaak.info/bbackupd.conf'
alias bbackupctl='bbackupctl -c /usr/local/etc/box/clients/boxbackup.vanbaak.info/bbackupd.conf'

alias bigfiles='ls -fld ./**/*(d`stat +device . `OL[1,100])'

alias tdpf='tcpdump -n -e -tttt -r /var/log/pflog'
alias tdpfi='tcpdump -n -e -tttt -i pflog0'

alias dvdleft='echo $(( ( 4700000000 - $( du -s . | sed "s/[^0-9]//g" ) ) /1024.0/1024.0))'

alias mkiso='mkisofs -r -o'
alias burniso='cdrecord -v -eject dev=1,0,0'

# Remove downloads older than 30 days.
alias rmdl30='find ~/Downloads -mtime +30 -exec rm -rf "{}" \;'

if [[ `uname -s` == "Darwin" ]]; then
    alias pubkeycp='cat ~/.ssh/id_dsa.pub |pbcopy |echo "Public key copied to clipboard."'
	alias hibernateon='sudo pmset -a hibernatemode 5'
	alias hibernateoff='sudo pmset -a hibernatemode 0'
fi

alias -s {avi,flv,mpg,mpeg,wmv}=/Applications/VLC.app/Contents/MacOS/VLC
alias -s txt=vim
alias -s html=firefox
alias -s pdf=open
alias -s tar="tar xf"
alias -s gz="gunzip"
alias -s bz2="bunzip2"
alias -s tgz="tar zxvf"
alias -s tbz2="tar jxvf"
alias -s zip="unzip"


function ff() { find . -type f -iname '*'$*'*' -ls; }
function fe() { find . -type f -iname '*'$1'*' -exec "${2:-file}" {} \; ; }
function fd() { find . -type d -iname '*'$*'*' -ls; }
function bytetombit() { echo $(( $1/1024.0**2*8 )) }
function mbittobyte() { echo $(( $1*1024.0**2/8 )) }
function texpdf() { pdflatex ${1}.tex && open ${1}.pdf } 

function newgitrepo() {
	if [ -d $1 ]; then
		echo "Repo $1 does already exist."
		return
	fi

	mkdir /pub/git/${1}
	pushd
	cd /pub/git/${1}
	git init --bare
	mv hooks/post-update.sample hooks/post-update
	chmod +x hooks/post-update
	vim description
	popd
}




#function title {
#  if [[ $TERM == "screen" ]]; then
#    # Use these two for GNU Screen:
#    print -nR $'\033k'$1$'\033'\\
#
#    print -nR $'\033]0;'$2$'\a'
#  elif [[ $TERM == "xterm" || $TERM == "rxvt" ]]; then
#    # Use this one instead for XTerms:
#    print -nR $'\033]0;'$*$'\a'
#  fi
#}
#  
#function precmd {
#  title zsh "$PWD"
#}
#  
#function preexec {
#  emulate -L zsh
#  local -a cmd; cmd=(${(z)1})
#  title $cmd[1]:t "$cmd[2,-1]"
#}

# Completion
zmodload zsh/complist
autoload -U compinit && compinit
### If you want zsh's completion to pick up new commands in $path automatically
### comment out the next line and un-comment the following 5 lines
zstyle ':completion:::::' completer _complete _approximate
#_force_rehash() {
#  (( CURRENT == 1 )) && rehash
#  return 1 # Because we didn't really complete anything
#}
#zstyle ':completion:::::' completer _force_rehash _complete _approximate
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'
zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*:corrections' format "- %d - (errors %e})"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes

# Correction
setopt correctall

# I don't like beeps
unsetopt beep

# Nice fancy globbing
setopt extendedglob

# Prompt 
autoload -U promptinit
promptinit
prompt elite2

autoload -U zsh/stat

bindkey '^K' kill-whole-line
bindkey "^R" history-incremental-search-backward
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
