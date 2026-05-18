# ---------- #
# Completion
# ---------- #

# Set dump file location for Zinit
ZINIT[ZCOMPDUMP_PATH]="$XDG_CACHE_HOME/zsh/zcompdump"

# Run compinit
autoload -Uz compinit
compinit -d "$ZINIT[ZCOMPDUMP_PATH]"

# Better completion menu
zstyle ':completion:*' menu select

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Colors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:*' fzf-flags --height=50% --pointer '»' \
    --color 'pointer:green,fg+:-1,bg+:-1,hl+:-1,marker:-1'

# fzf-tab previews
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --icons -a $realpath'
zstyle ':fzf-tab:complete:eza:*' fzf-preview 'eza -1 --icons -a $realpath'
zstyle ':fzf-tab:complete:bat:*' fzf-preview 'bat --color=always --theme=base16 $realpath'
zstyle ':fzf-tab:complete:nvim:*' fzf-preview 'bat --color=always --theme=base16 $realpath'

# Accept with space
zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
