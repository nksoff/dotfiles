#
# [aliases]
#
case ${OS} in
    freebsd|darwin)
        alias ls='ls -G'

        alias psa='ps -wwaxo user,ruser,pid,ppid,pri,pcpu,pmem,vsize,rss,tt,start,args'
        alias psme='ps -U ${LOGNAME} -wwaxo user,ruser,pid,ppid,pri,pcpu,pmem,vsize,rss,tt,start,args'

        # clear dns
        alias dns='sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder'
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

# time helpers
alias week='date +%V'
alias timer='echo "Stop me with Ctrl+D" && date && time cat && date'

# hex dump
command -v hd > /dev/null || alias hd="hexdump -C"

# hashing functions
command -v md5sum > /dev/null || alias md5sum="md5"
command -v sha1sum > /dev/null || alias sha1sum="shasum"
