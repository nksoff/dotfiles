#
# [variables]
#

(( ${+OS} ))        || export OS="${OSTYPE%%[0-9.]*}"
(( ${+OSVERSION} )) || export OSVERSION="${OSTYPE#$OS}"
(( ${+OSMAJOR} ))   || export OSMAJOR="${OSVERSION%%.*}"
(( ${+HOSTNAME} ))  || export HOSTNAME=$(hn)

# browser
if [[ "$OSTYPE" == darwin* ]]; then
    export BROWSER='open'
fi

# editors
if which vim &> /dev/null; then
    # vim
    export EDITOR="vim"
elif which vi &> /dev/null; then
    # vi
    export EDITOR="vi"
fi

# visual & pager
export VISUAL=$EDITOR
export PAGER='less'

# less options
export LESS='-F -g -i -M -R -S -w -X -z-4'

# temporary directory
if [[ ! -d "$TMPDIR" ]]; then
    export TMPDIR="/tmp/$USER"
    mkdir -p -m 700 "$TMPDIR"
fi

# temporary directory for zsh
TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
    mkdir -p "$TMPPREFIX"
fi

# user file creation mode mask
# 775, 664 by default
umask 0002

