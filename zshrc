#### Data Representation ####

func pp() {
    #read input
    input=$(</dev/stdin)

    case "$1" in
    xml)  echo $input | xmltool ;;
    json) echo $input | python -m json.tool  ;;
    cert) echo $input | openssl x509 -text -noout ;;
    esac
}
alias showcert='openssl x509 -text -noout -in'

#### Data Analysis ####

func extract() {
    input=$(</dev/stdin)

    case "$1" in
        between) echo $input | awk -v FS="($2|$3)" '{print $2}' ;;
        ip) echo $input | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" ;;
    esac
}

#### ZSH Config ####

setopt no_share_history
unalias rm


[ -f ~/.sman/sman.rc ] && source ~/.sman/sman.rc

#### Convenience ####

function randomhex() {
    LEN=16

    if [[ $1 != "" ]] then
        LEN=$1
    fi
    
    openssl rand -hex $LEN
}

alias cpy="xclip -selection c"
alias update-sys='apt update && apt upgrade -y'
alias vim='nvim'
alias fd='fdfind'
alias ll='exa -lh'
