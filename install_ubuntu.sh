#!/bin/bash

echo "Updating..."
sudo apt-get upgrade -y
sudo apt-get update -y

echo "Installing Common Dev Tools..."
sudo apt-get install build-essential curl wget git zsh neovim silversearcher-ag tmux universal-ctags ripgrep -y

echo "Installing RCM dotfiles manager..."
sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm -y
sudo apt-get update
sudo apt-get install rcm -y

echo "Installing NeoVim and dependencies..."
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

echo "Setting up Github key"
ssh-keygen -F github.com || ssh-keyscan github.com >>~/.ssh/known_hosts

echo "Cloning Dotfiles"
if [ ! -d "~/.dotfiles" ]; then
  git clone git@github.com:adamalbrecht/dotfiles-3.git ~/.dotfiles
else
  cd ~/.dotfiles
  git pull
fi
rcup

echo "Setting up Zsh"
if [ ! -d "~/.zprezto" ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "~/.zprezto"
fi
touch ~/.zshlocal

echo "Installing ASDF..."
if [ ! -d "~/.asdf" ]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
fi
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"

echo "Installing Ruby..."
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby 2.7.1

echo "Installing NodeJS..."
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "Installing FZF..."
if [ ! -d "~/.fzf" ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --no-zsh --no-bash --no-fish
fi

chsh -s /bin/zsh
