#
# [completions]
#

autoload -U compinit
compinit -i -u

# match uppercase from lowercase.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# don't insert tabs
zstyle ':completion:*' insert-tab false

# colors in completion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
