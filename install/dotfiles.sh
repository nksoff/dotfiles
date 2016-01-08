#!/bin/bash

source "$(dirname $0)/_lib.sh"

readonly FILESPATH="../files"
readonly BACKUPPATH="$HOME/.dotfiles-backup"

readonly PROGNAME=$(basename $0)
readonly PROGDIR=$(abspath $(dirname $0))
readonly ARGS="$@"

dotfiles_install() {
    local is_lite=$1
    local directory=$HOME

    local basefilename=
    local dotfilepath=

    for file in $PROGDIR/$FILESPATH/*
    do
        file=$(abspath $file)
        basefilename=$(basename $file)
        dotfilepath="$directory/.$basefilename"

        if [ "${basefilename%.local}" != "$basefilename" ]; then
            if ! is_file "$dotfilepath"; then
                cp -r "$file" "$dotfilepath"
                line_success "$basefilename is copied"
                continue
            else
                line_info "$basefilename already exists"
            fi
        else
            if is_link "$dotfilepath"; then
                local link=$(abspath $(readlink $dotfilepath))
                if [ "$link" == "$file" ]; then
                    line_info "$basefilename already exists"
                    continue
                fi
            fi

            if is_file "$dotfilepath"; then
                mkdir -p "$BACKUPPATH"
                mv "$dotfilepath" "$BACKUPPATH"
                line_info "$basefilename is backuped"
            fi

            ln -s "$file" "$dotfilepath"
            line_success "$basefilename is linked"
        fi
    done
}

dotfiles_plugins() {
    echo

    line_info "cloning vim plugin manager"
    git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    if [ $? -eq 0 ]; then
        line_success "vim plugin manager is cloned"
    fi

    line_info "installing vim plugins"
    vim --noplugin +BundleClean +BundleInstall +qall
    if [ $? -eq 0 ]; then
        line_success "vim plugins are installed"
    fi

    line_info "cloning tmux plugin manager"
    git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    if [ $? -eq 0 ]; then
        line_success "tmux plugin manager is cloned"
    fi

    line_info "cloning zsh antigen"
    git clone git@github.com:zsh-users/antigen.git ~/.antigen
    if [ $? -eq 0 ]; then
        line_success "zsh antigen is cloned"
    fi
}

main() {
    cmdline $ARGS
}

cmdline() {
    local is_lite=0

    local arg=

    for arg
    do
        local delim=""
        case "$arg" in
            --help)             args="${args}-h ";;
            --lite)             args="${args}-l ";;
            *) [[ "${arg:0:1}" == "-" ]] || delim="\""
                args="${args}${delim}${arg}${delim} ";;
        esac
    done

    eval set -- $args

    while getopts ":lhd:" OPTION
    do
        case $OPTION in
            h)
                logo
                usage
                exit 0
                ;;
            l)
                is_lite=1
                ;;
        esac
    done

    header
    dotfiles_install $is_lite
    dotfiles_plugins
}

logo() {
    cat $PROGDIR/_logo.txt
    echo
}

header() {
    logo
    line_clean "Well, now we are going to install dotfiles."
}

usage() {
cat <<- EOF
usage: $PROGNAME options

Program "installs" dotfiles.
It create links in your HOME to files in dotfiles directory.
If there are your own dotfiles in HOME, they will be backuped.
Also it downloads vim plugins, tmux plugins and zsh prezto.
In lite edition no tmux and no zsh prezto, some vim plugins are off.

OPTIONS:
    -l --lite           install lite edition of dotfiles
    -h --help           show this help


EXAMPLES:
    Just install dotfiles:
    $PROGNAME

    Install lite version of dotfiles:
    $PROGNAME -l

EOF
}

main
