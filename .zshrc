# Load aliases
source $HOME/.zsh/aliases

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

# Bookmarks
# @see https://threkk.medium.com/how-to-use-bookmarks-in-bash-zsh-6b8074e40774
if [ -d "$HOME/.bookmarks" ]; then
    export CDPATH=".:$HOME/.bookmarks:/"
    function goto() {
        echo "$fg[blue]Bookmarks:\n$fg[cyan]"
        if
            [ $# -eq 0 ]
            cd -P "$@"
        then
            ls -1 $HOME/.bookmarks

            echo "$fg[black]\nTo add a new bookmark:\n"
            echo "ln -s path/to/certain/directory/with/my/project ~/.bookmarks/@important-project$reset_color"
        fi
    }
    # alias goto="cd -P"
fi

# Deno
export DENO_INSTALL="/Users/nate/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Greymatter Tools
export PATH="$PATH:$HOME/repos/greymatter/gm-tools/bin"

export EDITOR="/usr/bin/vim"

# Enable direnv
eval "$(direnv hook zsh)"

# Enable rbenv
eval "$(rbenv init - zsh)"

aws-ado() {
  aws sso login --profile dicelab-ado
  aws sts get-caller-identity --profile dicelab-ado
  aws-ado-ssh
}
# AWS SSM session for SSH Port Forwarding
aws-ado-ssh() {
  aws ssm start-session --profile ado --target i-0118c75ff024cbd21 --document-name AWS-StartPortForwardingSession --parameters "portNumber"=\["22"\],"localPortNumber"=\["9998"\]
}
# AWS SSM session for RDP Port Forwarding
aws-ado-rdp() {
  aws ssm start-session --profile ado --target i-0118c75ff024cbd21 --document-name AWS-StartPortForwardingSession --parameters "portNumber"=\["3389"\],"localPortNumber"=\["9999"\]
}

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/nate/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
