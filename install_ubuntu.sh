#!/bin/bash

echo "Updating..."
apt-get update

echo "Installing Common Dev Tools..."
apt-get install curl wget git zsh silversearcher-ag tmux universal-ctags

echo "Installing RCM dotfiles manager..."
add-apt-repository ppa:martin-frost/thoughtbot-rcm
apt-get update
apt-get install rcm

echo "Installing NeoVim and dependencies..."
apt-get install software-properties-common
apt-get install python-software-properties
apt-get install python-dev python-pip python3-dev python3-pip
add-apt-repository ppa:neovim-ppa/stable
apt-get update
apt-get install neovim

echo "Cloning Dotfiles"
if ! [ ! -f "~/.dotfiles" ]; then
  git clone git@github.com:adamalbrecht/dotfiles-3.git ~/.dotfiles
else
  cd ~/.dotfiles
  git pull
fi
rcup

echo "Installing ASDF..."
if ! [ ! -f "~/.asdf" ]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
fi
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"

echo "Installing Ruby..."
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby 2.7.1


echo "Installing FZF..."
if ! [ ! -f "~/.fzf" ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
else
  cd ~/.fzf
  git pull
fi
~/.fzf/install
