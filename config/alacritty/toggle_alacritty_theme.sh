#!/usr/bin/env bash
if grep -q '*light' ~/.dotfiles/config/alacritty/alacritty.yml; then
  echo "LIGHT TO DARK"
  sed -i '' -- 's/*light/*dark/g' ~/.dotfiles/config/alacritty/alacritty.yml
else
  echo "DARK TO LIGHT"
  sed -i '' -- 's/*dark/*light/g' ~/.dotfiles/config/alacritty/alacritty.yml
fi
