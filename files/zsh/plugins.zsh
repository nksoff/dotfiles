#
# [plugins]
#

# autojump
if [ $commands[autojump] ]; then # check if autojump is installed
    if [ -f $HOME/.autojump/etc/profile.d/autojump.zsh ]; then # manual user-local installation
        . $HOME/.autojump/etc/profile.d/autojump.zsh
    elif [ -f $HOME/.autojump/share/autojump/autojump.zsh ]; then # another manual user-local installation
        . $HOME/.autojump/share/autojump/autojump.zsh
    elif [ -f $HOME/.nix-profile/etc/profile.d/autojump.zsh ]; then # nix installation
        . $HOME/.nix-profile/etc/profile.d/autojump.zsh
    elif [ -f /usr/share/autojump/autojump.zsh ]; then # debian and ubuntu package
        . /usr/share/autojump/autojump.zsh
    elif [ -f /etc/profile.d/autojump.zsh ]; then # manual installation
        . /etc/profile.d/autojump.zsh
    elif [ -f /etc/profile.d/autojump.sh ]; then # gentoo installation
        . /etc/profile.d/autojump.sh
    elif [ -f /usr/local/share/autojump/autojump.zsh ]; then # freebsd installation
        . /usr/local/share/autojump/autojump.zsh
    elif [ -f /opt/local/etc/profile.d/autojump.zsh ]; then # mac os x with ports
        . /opt/local/etc/profile.d/autojump.zsh
    elif [ $commands[brew] -a -f `brew --prefix`/etc/autojump.sh ]; then # mac os x with brew
        . `brew --prefix`/etc/autojump.sh
    fi
fi

# thefuck
if [ $commands[thefuck] ]; then
    eval "$(thefuck --alias)"
    fuck-command-line() {
        local FUCK="$(THEFUCK_REQUIRE_CONFIRMATION=0 thefuck $(fc -ln -1 | tail -n 1) 2> /dev/null)"
        [[ -z $FUCK ]] && echo -n -e "\a" && return
        BUFFER=$FUCK
        zle end-of-line
    }
    zle -N fuck-command-line
    bindkey "\e\e" fuck-command-line
fi
