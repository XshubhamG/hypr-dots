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

# bun completions
[ -s "/home/xshubhamg/.bun/_bun" ] && source "/home/xshubhamg/.bun/_bun"
