#
# [antigen]
#

source ~/.antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle git
antigen bundle autojump
antigen bundle composer
antigen bundle gem
antigen bundle brew
antigen bundle nyan
antigen bundle vagrant
antigen bundle docker

if [[ -n $commands[thefuck] ]]; then
    antigen bundle thefuck
fi

antigen bundle zsh-users/zsh-completions src
antigen theme nksoff/slim-zsh-theme slim
antigen bundle zsh-users/zsh-syntax-highlighting
