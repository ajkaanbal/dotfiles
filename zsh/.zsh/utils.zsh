#Random string
function genkey() {
    size=32
    if [ -z "$1" ]; then
        size=32
    else
        size=$1
    fi
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-$size} | head -n 1
}
