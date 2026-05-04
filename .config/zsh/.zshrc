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
typeset -U path PATH
path=(
  "$HOME/.local/bin"
  "$CARGO_HOME/bin"
  "$GOPATH/bin"
  ${PNPM_HOME:+$PNPM_HOME}
  "$HOME/.spicetify"
  $path
)
export PATH

export MANPAGER='nvim +Man!'
export VISUAL=nvim
export EDITOR=nvim
export PAGER=bat

# ------------- #
#  Zinit boot
# ------------- #
ZINIT_HOME="${XDG_DATA_HOME}/zinit/zinit.git"
if [[ ! -r "$ZINIT_HOME/zinit.zsh" ]]; then
  mkdir -p "${ZINIT_HOME:h}"
  git clone --depth=1 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "$ZINIT_HOME/zinit.zsh"

# ------------- #
#  Plugins
# ------------- #
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-completions

zinit ice wait lucid blockf
zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid
zinit light zsh-users/zsh-syntax-highlighting

zinit ice wait lucid blockf
zinit light Aloxaf/fzf-tab

# source ~/hypr-dots/manual-zsh-plugins/zcolors/zcolors.plugin.zsh

# 3. Run zcolors
if (( $+commands[zcolors] )) && [[ ! -f ${XDG_CACHE_HOME:-$HOME/.cache}/zcolors ]]; then
    zcolors ${(q+)LS_COLORS} >| ${XDG_CACHE_HOME:-$HOME/.cache}/zcolors
fi

[[ -r ${XDG_CACHE_HOME:-$HOME/.cache}/zcolors ]] && source ${XDG_CACHE_HOME:-$HOME/.cache}/zcolors

# ------------- #
#  Completions
# ------------- #
setopt extendedglob
typeset -U fpath
fpath=("$XDG_CONFIG_HOME/zsh/completions" $fpath)
autoload -Uz compinit
zcompdump="$XDG_CONFIG_HOME/zsh/.zcompdump"

if [[ -n ${zcompdump}(#qN.mh+24) ]]; then
  compinit -d "$zcompdump"
else
  compinit -C -d "$zcompdump"
fi
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

(( $+commands[zoxide] )) && eval "$(zoxide init --cmd cd zsh)"
[[ -r "$HOME/.local/bin/env" ]] && . "$HOME/.local/bin/env"

_cache_completion() {
  emulate -L zsh
  local name="$1"
  shift
  local cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/completions"
  local cache_file="$cache_dir/$name.zsh"

  [[ -d "$cache_dir" ]] || mkdir -p "$cache_dir" 2>/dev/null || return
  if [[ ! -s "$cache_file" ]] || [[ -n ${commands[$1]} && "$commands[$1]" -nt "$cache_file" ]]; then
    "$@" >| "$cache_file" 2>/dev/null
  fi
  [[ -r "$cache_file" ]] && source "$cache_file"
}

(( $+commands[uv] )) && _cache_completion uv uv generate-shell-completion zsh
(( $+commands[uvx] )) && _cache_completion uvx uvx --generate-shell-completion zsh

# To customize prompt, run `p10k configure` or edit ~/hypr-dots/.config/zsh/.p10k.zsh.
[[ ! -f ~/hypr-dots/.config/zsh/.p10k.zsh ]] || source ~/hypr-dots/.config/zsh/.p10k.zsh

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
alias zed="zeditor"
alias lz="lazygit" 
alias c="clear" 
alias rm="trash -v" 
alias ff="pokeget random --hide-name | fastfetch --file -"

# Changing "ls" to "eza"
alias ls='eza --icons --color=always --group-directories-first' 
alias la='eza -abhHlS --icons --color=always --group-directories-first' 
alias ll='eza -a --icons --color=always --group-directories-first' 
alias l='eza -F --icons --color=always --group-directories-first' 
alias l.='eza -a | grep -E "^\."'
alias lt="eza -aT --icons --color=always --level=2"

# help with bat 
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

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
alias gp="git push"
alias gl="git log"
alias gsw="git switch"

# added nvm
_load_nvm() {
  unset -f nvm node npm npx corepack
  [[ -r /usr/share/nvm/init-nvm.sh ]] && source /usr/share/nvm/init-nvm.sh
}

nvm() { _load_nvm; nvm "$@"; }
node() { _load_nvm; node "$@"; }
npm() { _load_nvm; npm "$@"; }
npx() { _load_nvm; npx "$@"; }
corepack() { _load_nvm; corepack "$@"; }
