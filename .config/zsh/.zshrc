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

zstyle ':fzf-tab:*' fzf-flags --height=50% --pointer '»'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --icons --color=always -a $realpath'
zstyle ':fzf-tab:complete:eza:*' fzf-preview 'eza --icons --color=always -a $realpath'
zstyle ':fzf-tab:complete:bat:*' fzf-preview 'bat --color=always $realpath'
zstyle ':fzf-tab:complete:nvim:*' fzf-preview 'bat --color=always $realpath'

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
export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .git --exclude node_modules --strip-cwd-prefix"
export FZF_DEFAULT_OPTS="--height=60% ..."
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d ..."
[ -f ~/hypr-dots/fzf/.fzf.zsh ] && source ~/hypr-dots/fzf/.fzf.zsh

# ------------- #
#  Extras: bun, zoxide, uv, pnpm
# ------------- #
source ~/.config/zsh/completions/_bun
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
# -------------- # 
# Aliases # 
# -------------- # 
alias v="nvim" 
alias lz="lazygit" 
alias c="clear" 
alias rm="trash -v" 
alias ff="pokeget random --hide-name | fastfetch --file -"

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

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
