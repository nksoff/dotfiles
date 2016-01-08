#
# [functions]
#

# hostname
hn() {
    tmphost=${$(uname -n)%.local}
    if [ -f ~/.hostname ]; then
        tmphost=$(cat ~/.hostname)
    fi
    echo $tmphost | tr 'A-Z' 'a-z'
}

# realpath to file/directory
realpath() { for f in "$@"; do echo ${f}(:A); done }
