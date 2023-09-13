# Load aliases
source $HOME/.zsh/aliases.zsh
# Load functions
source $HOME/.zsh/functions.zsh

autoload -Uz compinit && compinit
autoload zmv
autoload -U colors && colors

# Start SSH agent
eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain ~/.ssh/id_ed25519

alias k=kubectl
# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

alias t="todo.sh -a"

alias "../"="cd ../"
alias "../../"="cd ../../"
alias "../../../"="cd ../../../"

alias ls="ls -G"

export N_PREFIX="$HOME/n"
[[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin" # Added by n-install (see http://git.io/n-install-repo).

# Greymatter Tools
export PATH="$PATH:$HOME/repos/greymatter/gm-tools/bin"

export EDITOR="/usr/bin/vim"

# Enable rbenv
eval "$(rbenv init - zsh)"

# Augment the PATH
source $HOME/.zsh/path.zsh

# Load specific program initializations
source $HOME/.zsh/initializations.zsh
