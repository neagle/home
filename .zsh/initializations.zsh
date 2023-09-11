# Deno
export DENO_INSTALL="/Users/nate/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Enable direnv
eval "$(direnv hook zsh)"

# zoxide, the z command for superpowered cd
eval "$(zoxide init zsh)"

# fzf, used for zoxide
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
