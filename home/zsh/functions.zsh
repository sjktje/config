function dk() { cd ~/Documents/Skola/RKH/DK${1} }
function ff() { find . -type f -iname '*'$*'*' -ls; }
function fe() { find . -type f -iname '*'$1'*' -exec "${2:-file}" {} \; ; }
function fd() { find . -type d -iname '*'$*'*' -ls; }
function ffind() { egrep -i $* ${HOME}/.allfiles }
function bytetombit() { echo $(( $1/1024.0**2*8 )) }
function mbittobyte() { echo $(( $1*1024.0**2/8 )) }
function texpdf() { pdflatex ${1}.tex && open ${1}.pdf }
function cl() { cd ${1} && ls }
function 6p() {
	ret=$(curl -s -F "content=<${1--}" -F ttl=604800 -w "%{redirect_url}\n" -o /dev/null https://p.6core.net/;)

	if [[ `uname -s` == "Darwin" ]]; then
		echo $ret |pbcopy
		echo "Copied url (${ret}) to clipboard."
	else
		echo "${ret}"
	fi
}

# "code <project>" changes directory to ~/Code/project and switches to
# whatever virtualenv is specified in ~/Code/project/.venv, if such file
# exists.
function code() {
    if [ ! -n "$1" ]
    then
        echo "Usage: code <code directory>"
        return 1
    fi

    CODE_DIRECTORY="${HOME}/Code/${1}"

    if [ ! -n "$CODE_DIRECTORY" ]
    then
        echo "Code directory $CODE_DIRECTORY does not exist."
        return 1
    fi

    cd $CODE_DIRECTORY

    if [ -e ".venv" ]
    then
        venv=$(cat .venv)
        workon $venv
    fi
}

function wgetfilewait() {
    USER_AGENT="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36"
    $(wget --random-wait --wait=${1:-2m} -i ${2:-download.txt} -U ${USER_AGENT})
}
