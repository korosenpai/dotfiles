# find file by name

# TODO: make it be case insensitive
[ ! -z "$1" ] && find . -name "*$1*" || exit 1
