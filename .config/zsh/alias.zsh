# ------------- #
#  Keys + Aliases
# ------------- #
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^x^e' edit-command-line
bindkey ' ' magic-space
bindkey '^Y' autosuggest-accept

# -------------- #
#     Aliases    #
# -------------- #
alias v="neovide"
alias vim="nvim"
alias zed="zeditor"
alias lz="lazygit"
alias c="clear"
alias rm="trash -v"
alias ff="pokeget random --hide-name | fastfetch --file -"

# Changing "ls" to "eza"
alias ls='eza --icons'
alias la='eza -lah --icons --group-directories-first'
alias ll='eza -lh --icons --group-directories-first'
alias l='eza -F --icons --group-directories-first' 
alias l.='eza -a | grep -E "^\."'
alias lt="eza -aT --icons --level=2"

# help with bat 
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

# core utils
alias rg="rg --color=auto"
alias diff="diff --color=auto"
alias df='df -h'

#aur helper
alias yy='yay' 
alias yi='yay -S' 
alias yr='yay -R' 
alias yrns='yay -Rns'

# git alias
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log"
alias gsw="git switch"
