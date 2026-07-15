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
zstyle ':completion:*' matcher-list \
    'm:{a-z}={A-Z}' \
    'r:|[._-]=* r:|=*'

# completion caching
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
zstyle ':completion:*:*:*:*:processes' command \
'ps -u $USER -o pid,user,comm'

# Colors
source ~/.cache/zcolors.zsh

# fzf-tab previews
zstyle ':fzf-tab:*' fzf-flags \
--color=bg+:#1e1e2e,spinner:#7dcfff,hl:#73daca \
--color=fg:#cdd6f4,header:#73daca,info:#cba6f7,pointer:#e0af68 \
--color=marker:#7dcfff,fg+:#cdd6f4,prompt:#cba6f7,hl+:#73daca \
--height=80% \
--layout=reverse \
--border=rounded \
--info=inline \
--pointer='»' \
--marker='⇒'

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always --icons -a $realpath'
zstyle ':fzf-tab:complete:eza:*' fzf-preview 'eza -1 --color=always --icons -a $realpath'
zstyle ':fzf-tab:complete:bat:*' fzf-preview 'bat --color=always $realpath'
zstyle ':fzf-tab:complete:nvim:*' fzf-preview 'bat --color=always $realpath'

# Accept with space
zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
