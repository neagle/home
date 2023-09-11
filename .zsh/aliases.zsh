# Config: use a bare git repo in the home directory to version-control dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# todo.txt
alias t="todo.sh -a"
