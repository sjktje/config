# Return dir path of last finder window
function pfd() {
    osascript 2>/dev/null <<EOF
        tell application "Finder"
            return POSIX path of (target of window 1 as alias)
        end tell
EOF
}

# Cd to finder window path
function cdf() {
    cd "$(pfd)"
}


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

# Extension aliases
alias -s {avi,flv,mpg,mpeg,wmv,mp4,mov,mkv}=/Applications/VLC.app/Contents/MacOS/VLC
