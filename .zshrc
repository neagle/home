# Load aliases
source $HOME/.zsh/aliases.zsh

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


# Greymatter Tools
export PATH="$PATH:$HOME/repos/greymatter/gm-tools/bin"

export EDITOR="/usr/bin/vim"

# Enable rbenv
eval "$(rbenv init - zsh)"

# Augment the PATH
source $HOME/.zsh/path.zsh

# Load specific program initializations
source $HOME/.zsh/initializations.zsh
