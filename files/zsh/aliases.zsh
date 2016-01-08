#
# [aliases]
#
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
        export LSCOLORS="GxFxFxdxCxDxDxhbadExEx"
        export CLICOLORS="YES"
        alias ls='ls -G'

        alias psa='ps -wwaxo user,ruser,pid,ppid,pri,pcpu,pmem,vsize,rss,tt,start,args'
        alias psme='ps -U ${LOGNAME} -wwaxo user,ruser,pid,ppid,pri,pcpu,pmem,vsize,rss,tt,start,args'
        ;;
    linux-gnu)
        alias ls='ls --color=auto'
        alias psa='ps -eo user,ruser,pid,ppid,pri,pcpu,pmem,vsize,rss,tt,start,args'
        alias psme='psa | grep -E "^USER|${LOGNAME}"'
        ;;
esac

# grep
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'

# vim
if which vim &> /dev/null; then
    alias v="vim"
    alias vi="vim"
fi

# cp, mv, rm
# with confirmations not to lose some files
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# directory size
alias ds="du -sh"
# all files in directory sizes
alias dsa="\du -ah"

# creating directories
alias mcd='f () { mkdir -p $1 && cd $1; }; f '
alias mkdir='mkdir -p'

# listing
alias la='ls -al'
alias ll='ls -l'
alias lsa='ls -ld .*'

# please, root
alias please="sudo"

# exit vim-like
alias :q="exit"
alias :qa="exit"

# git noglob
alias git='noglob git'

# logtail
alias logtail='tail -f'
