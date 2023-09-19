```
    ________________________
    `'-.,________,,..-  ___ \________
       > `'-.,_____,,.-`<_>\ )__     `\
         >            `'-._    _)____  \
          >          _.-'`  _______  `\ |
           >   _,,..--'''```       `'-.\|
          >-'``                        `'
```

# Home

This is where I manage my dotfiles and all the me-specific setup and customization I want to carry from computer to computer.

## Setting up the Environment on a New Machine

`git clone git@github.com:neagle/home.git $HOME/.cfg`

Prevent git status from showing untracked files. In this case, the vast majority of files are ones we do not want to track as part of the repo.

`config config --local status.showUntrackedFiles no`

## Usage

This uses a custom `config` command that is an aliased version of the `git` command with particular flags. It is present in this repo's zsh aliases, but if you need to add it somewhere for any reason, the alias is this:

`alias config='/usr/bin/git --git-dir=$HOME/.cfg/.git --work-tree=$HOME'`

To add a new file:

`config add <file-path>`

Then commit / push like normal, using `config` instead of `git`.

## References

* [The initial guide I used to set this up](https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/)
