# ------------- #
#  Instant prompt
# ------------- #
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ------------- #
#  Basic env + PATH
# ------------- #
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export PATH="$PATH:$HOME/.local/bin:$CARGO_HOME/bin:$GOPATH/bin:$PNPM_HOME:/home/xshubhamg/.spicetify"

export MANPAGER='nvim +Man!'
export VISUAL=nvim
export EDITOR=nvim
export PAGER=bat

# ------------- #
#  Zinit boot
# ------------- #
ZINIT_HOME="${XDG_DATA_HOME}/zinit/zinit.git"
[[ ! -d "$ZINIT_HOME" ]] && { mkdir -p "$(dirname $ZINIT_HOME)"; git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"; }
source "$ZINIT_HOME/zinit.zsh"

# ------------- #
#  Plugins
# ------------- #
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found
zinit snippet OMZP::git

source ~/hypr-dots/manual-zsh-plugins/zcolors/zcolors.plugin.zsh

# zcolor
# 1. Setup paths
fpath=( ~/Repos/zcolors/functions $fpath )
autoload -Uz zcolors

# 2. Define local reply to catch the "global" leak
local -a reply 

# 3. Run zcolors
if [[ ! -f ${XDG_CACHE_HOME:-$HOME/.cache}/zcolors ]]; then
    zcolors ${(q+)LS_COLORS} >| ${XDG_CACHE_HOME:-$HOME/.cache}/zcolors
fi

source ${XDG_CACHE_HOME:-$HOME/.cache}/zcolors

# ------------- #
#  Completions
# ------------- #
autoload -Uz compinit && compinit
zinit cdreplay -q

# ------------- #
#  Styles
# ------------- #
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' matcher-list \
  'm:{a-zA-Z}={A-Za-z}' \
  '+r:|[._-]=* r:|=*' \
  '+l:|=*'

zstyle ':fzf-tab:*' fzf-flags --height=50% --pointer '»' \
    --color 'pointer:green,fg+:-1,bg+:-1,hl+:-1,marker:-1'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --icons --color=always -a $realpath'
zstyle ':fzf-tab:complete:eza:*' fzf-preview 'eza -1 --icons --color=always -a $realpath'
zstyle ':fzf-tab:complete:bat:*' fzf-preview 'bat --color=always --theme=base16 $realpath'
zstyle ':fzf-tab:complete:nvim:*' fzf-preview 'bat --color=always --theme=base16 $realpath'
zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
zstyle ':fzf-tab:*' accept-line enter

# ------------- #
#  Shell options
# ------------- #
setopt autocd magicequalsubst numericglobsort promptsubst
setopt appendhistory sharehistory hist_ignore_dups hist_find_no_dups hist_ignore_all_dups hist_ignore_space hist_save_no_dups
HISTSIZE=10000
HISTFILE=~/.config/zsh/.zsh_history
SAVEHIST=$HISTSIZE

# ------------- #
#  FZF
# ------------- #
export FZF_DEFAULT_OPTS=" \
--color=bg+:#1e1e2e,spinner:#7dcfff,hl:#73daca \
--color=fg:#cdd6f4,header:#73daca,info:#cba6f7,pointer:#e0af68 \
--color=marker:#7dcfff,fg+:#cdd6f4,prompt:#cba6f7,hl+:#73daca --height=60% --tmux 80% --border --prompt '∷ ' --pointer » --marker ⇒"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .git --exclude node_modules --strip-cwd-prefix"

# Ctrl-T command
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --theme base16 --color=always --line-range :150 {}'"

# Alt-C command
export FZF_ALT_C_COMMAND="fd --type d . --color=never --hidden --exclude .git --exclude node_modules"
export FZF_ALT_C_OPTS="--walker-skip .git,node_modules,target --preview 'eza -T --icons --color=always {} | head -n 50'"
[ -f ~/hypr-dots/fzf/.fzf.zsh ] && source ~/hypr-dots/fzf/.fzf.zsh

# ------------- #
#  Extras: bun, zoxide, uv, sesh
# ------------- #
source ~/.config/zsh/completions/_bun
source ~/.config/zsh/completions/_sesh
eval "$(zoxide init --cmd cd zsh)"
. "$HOME/.local/share/../bin/env"
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

# ------------- #
#  Keys + Aliases
# ------------- #
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^x^e' edit-command-line
bindkey ' ' magic-space
bindkey '^Y' autosuggest-accept
bindkey -s '^[k' 'tmux new-session -A -s "Home 󰣇"\n'

# -------------- # 
#     Aliases    # 
# -------------- # 
alias v="nvim" 
alias zed="zeditor"
alias lz="lazygit" 
alias c="clear" 
alias rm="trash -v" 
alias ff="pokeget random --hide-name | fastfetch --file -"
alias ts="tmux new-session -A -s 'Home 󰣇'"

# Changing "ls" to "eza"
alias ls='eza --icons --color=always --group-directories-first' 
alias la='eza -abhHlS --icons --color=always --group-directories-first' 
alias ll='eza -a --icons --color=always --group-directories-first' 
alias l='eza -F --icons --color=always --group-directories-first' 
alias l.='eza -a | grep -E "^\."' alias lt="eza -aT --icons --color=always --level=2"

# help with bat 
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

alias yy='yay' 
alias yi='yay -S' 
alias yr='yay -R' 
alias yrns='yay -Rns'

# git alias
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gp="git push"
alias gl="git log"
alias gsw="git switch"

# To customize prompt, run `p10k configure` or edit ~/hypr-dots/.config/zsh/.p10k.zsh.
[[ ! -f ~/hypr-dots/.config/zsh/.p10k.zsh ]] || source ~/hypr-dots/.config/zsh/.p10k.zsh
