#!/bin/bash

# absolute path
abspath() {
    if [[ -d "$1" ]]
    then
        pushd "$1" >/dev/null
        pwd
        popd >/dev/null
    elif [[ -e $1 ]]
    then
        pushd "$(dirname "$1")" >/dev/null
        echo "$(pwd)/$(basename "$1")"
        popd >/dev/null
    else
        echo "$1" does not exist! >&2
        return 127
    fi
}

# is_interactive && echo "we are in interactive mode"
is_interactive() {
    [[ $- =~ "i" ]] && [[ -t 0 ]] && return 0
    return 1
}

# is_pipeline && cat -
is_pipeline() {
    [[ -t 0 ]] && return 1 || return 0
}

# is_writable my/path/foo.txt || echo "not writable"
is_writable() {
    [[ -w "$1" ]] && return 0 || return 1
}

# is_file my/path/foo.txt || echo "not a file"
is_file() {
    [[ -f "$1" ]] && return 0 || return 1
}

# is_dir /my/path || { echo "directory does not exist"; exit 1; }
is_dir() {
    [[ -d "$1" ]] && return 0 || return 1;
}

# is_link /my/path/to/link || echo "not a link"
is_link() {
    [[ -L "$1" ]] && return 0 || return 1;
}

# ask "Remove all files in /?" N
ask() {
    local prompt, default, REPLY
    while true; do
        if [ "${2:-}" = "Y" ]; then
            prompt="Y/n"
            default=Y
        elif [ "${2:-}" = "N" ]; then
            prompt="y/N"
            default=N
        else
            prompt="y/n"
            default=
        fi

        read -p "$1 [$prompt] " REPLY </dev/tty
        if [ -z "$REPLY" ]; then
            REPLY=$default
        fi

        case "$REPLY" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac
    done
}

# color "This is my cyan string" cyan
color() {
    # Parameters
    local message=$1
    local color=${2-'default'}
    local attribute=${3-'none'}

    # Other vars
    local color_type='3'
    local color_code='0'

    # Colors
    case $color in
        black)   color_code='0';;
        red)     color_code='1';;
        green)   color_code='2';;
        yellow)  color_code='3';;
        blue)    color_code='4';;
        magenta) color_code='5';;
        cyan)    color_code='6';;
        white)   color_code='7';;
    esac

    # Font styles, bold, underline etc
    case $attribute in
        bold)       attribute_code=';1';;
        underline)  attribute_code=';4';;
        reverse)    attribute_code=';7';;
        background) attribute_code='0;1;4';;
    esac

    echo -en "\033[${color_type}${color_code}${attribute_code}m"
    echo -en "$message"
    echo -en "\033[0m\n"

    return
}

# cyan line separated from other text
line_clean() {
    echo
    color "$1" cyan
    echo
}

# cyan info line
line_info() {
    color "$1" cyan
}

# green success line
line_success() {
    color "+ $1" green
}

# red error line
line_error() {
    color "- $1" red
}
