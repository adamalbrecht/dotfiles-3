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

# === Doximity Specific ===
if [[ -s "/Users/adam/work/dox-compose/bin/dox-init" ]]; then
  eval "$("/Users/adam/work/dox-compose/bin/dox-init")"
fi

# === ALIASES ===

alias brewup="brew update; brew upgrade; brew prune; brew cleanup --prune-prefix; brew doctor"

# Tmux
alias mux="tmuxinator"
alias tmux="tmux -2"
alias tml="tmux list-sessions"

# Ruby
alias ror "bundle exec rails"
alias dbmigrate "bundle exec rake db:migrate db:rollback; and bundle exec rake db:migrate"
alias be "bundle exec"

source ~/.zshlocal

# Vim -> Neovim
# if type nvim > /dev/null 2>&1; then
#   alias vim='nvim'
# fi

# # Docker
# if [ -x "$(command -v docker)" ]; then
#   alias docker-stop-all "docker stop $(docker ps -q)"
# fi
