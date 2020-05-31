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
. $(brew --prefix asdf)/asdf.sh

# Customize to your needs...

# === Auto Set Kitty Theme ===
if [ -x "$(command -v kitty)" ]; then
  if [[ ( $(2>/dev/null defaults read -g AppleInterfaceStyle) =~ 'Dark') ]]; then
    kitty @ set-colors --all --configured ~/.config/kitty/dark_theme.conf
  else
    # kitty @ --to unix:/tmp/kitty set-colors --reset
    kitty @ set-colors --all --configured ~/.config/kitty/light_theme.conf
  fi
fi

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

# Vim -> Neovim
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# Ruby
alias ror "bundle exec rails"
alias dbmigrate "bundle exec rake db:migrate db:rollback; and bundle exec rake db:migrate"
alias be "bundle exec"

# Docker
if [ -x "$(command -v docker)" ]; then
  alias docker-stop-all "docker stop $(docker ps -q)"
fi
