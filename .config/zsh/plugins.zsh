# ------------- #
#  Plugins
# ------------- #
zinit ice depth=1;zinit light zsh-users/zsh-completions

zinit ice wait lucid blockf
zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid
zinit light zsh-users/zsh-syntax-highlighting

zinit ice wait lucid blockf
zinit light Aloxaf/fzf-tab


# 3. Run zcolors
if (( $+commands[zcolors] )) && [[ ! -f ${XDG_CACHE_HOME:-$HOME/.cache}/zcolors ]]; then
    zcolors ${(q+)LS_COLORS} >| ${XDG_CACHE_HOME:-$HOME/.cache}/zcolors
fi

[[ -r ${XDG_CACHE_HOME:-$HOME/.cache}/zcolors ]] && source ${XDG_CACHE_HOME:-$HOME/.cache}/zcolors
