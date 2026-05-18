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

# EDITOR
export VISUAL=nvim
export EDITOR=nvim

# PAGER
export MANPAGER='nvim +Man!'
export PAGER=bat

# Starship
export STARSHIP_CONFIG="$ZDOTDIR/starship.toml"
