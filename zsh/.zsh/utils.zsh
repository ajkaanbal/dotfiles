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

function version(){
    echo $(git describe --abbrev=0 --tags || echo "NO-TAG")-$(git rev-parse --verify HEAD --short || echo "no-git")
}

function branches() {
    git for-each-ref --sort='-authordate:iso8601' --format=' %(color:green)%(authordate:iso8601)%09%(color:white)%(refname:short)' refs/heads
}


alias guardrail='cs launch com.twilio::guardrail:0.62.0 --'
# alias amm='cs launch com.lihaoyi:ammonite_2.13.1:2.0.4 -M ammonite.Main'
