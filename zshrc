#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu
#


# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source Asdf
. $HOME/.asdf/asdf.sh

# Customize to your needs...

# === ALIASES ===

alias rmrm="command rm"
alias rm="rmtrash"

alias brewup="brew update; brew upgrade; brew prune; brew cleanup --prune-prefix; brew doctor"

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Tmux
alias mux="tmuxinator"
alias tmux="tmux -2"
alias tml="tmux list-sessions"

alias vi="command vim"
alias realvim="command vim"
alias vim='nvim'

# Ruby
alias dbmigrate "bundle exec rake db:migrate db:rollback; and bundle exec rake db:migrate"
alias be "bundle exec"

# FZF
# Use silver searcher for list files from the filesystem
# and ignore git files
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

source ~/.zshlocal
