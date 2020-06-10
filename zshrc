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
alias ror "bundle exec rails"
alias dbmigrate "bundle exec rake db:migrate db:rollback; and bundle exec rake db:migrate"
alias be "bundle exec"

source ~/.zshlocal

# # Docker
# if [ -x "$(command -v docker)" ]; then
#   alias docker-stop-all "docker stop $(docker ps -q)"
# fi
