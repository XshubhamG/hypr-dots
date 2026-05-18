# ------------- #
#  Shell options
# ------------- #
setopt autocd magicequalsubst numericglobsort promptsubst
setopt appendhistory sharehistory hist_ignore_dups hist_find_no_dups hist_ignore_all_dups hist_ignore_space hist_save_no_dups
HISTSIZE=10000
HISTFILE="$XDG_STATE_HOME/zsh/history"
SAVEHIST=$HISTSIZE

# ------------- #
#  Zinit boot
# ------------- #
ZINIT_HOME="${XDG_DATA_HOME}/zinit/zinit.git"
if [[ ! -r "$ZINIT_HOME/zinit.zsh" ]]; then
  mkdir -p "${ZINIT_HOME:h}"
  git clone --quiet --depth=1 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "$ZINIT_HOME/zinit.zsh"

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# ------------- #
# Modularized config
# ------------- #
source "$HOME/.local/bin/env"
source "$ZDOTDIR/completion.zsh"
source "$ZDOTDIR/plugins.zsh"
source "$ZDOTDIR/fzf.zsh"
source "$ZDOTDIR/alias.zsh"
source "$ZDOTDIR/utils.zsh"

# starship
eval "$(starship init zsh)"
