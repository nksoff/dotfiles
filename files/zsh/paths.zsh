#
# [paths]
#
typeset -gU cdpath fpath mailpath path

# where zsh searches directories to change directory
cdpath=(
$cdpath
)

# where zsh searches for functions
fpath=(
~/.zsh.prompts
$fpath
)

# where zsh searches for programs
path=(
/usr/local/{bin,sbin}
/opt/local/{bin,sbin}
/usr/local/{php5,mysql}/bin
/usr/{bin,sbin}
~/.rvm/bin
~/.rbenv/bin
~/.bin.local
~/.bin
~/bin
$path
)
