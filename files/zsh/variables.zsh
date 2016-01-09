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

# ls colors
case ${OS} in
    freebsd|darwin)
        # First letter: foreground. Second: background.
        # a -- black
        # b -- red
        # c -- green
        # d -- brown
        # e -- blue
        # f -- magenta
        # g -- cyan
        # h -- light gray
        # A -- bold black, usually shows up as dark gray
        # B -- bold red
        # C -- bold green
        # D -- bold brown, usually shows up as yellow
        # E -- bold blue
        # F -- bold magenta
        # G -- bold cyan
        # H -- bold light gray; looks like bright white
        # x -- default foreground or background
        # Order:
        # 01) DIR
        # 02) SYM_LINK
        # 03) SOCKET
        # 04) PIPE
        # 05) EXE
        # 06) BLOCK_SP
        # 07) CHAR_SP
        # 08) EXE_SUID
        # 09) EXE_GUID
        # 10) DIR_STICKY
        # 11) DIR_WO_STICKY
        export LSCOLORS='Gxfxcxdxbxegedabagacad'
        export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
        export CLICOLORS="YES"
        ;;
esac
