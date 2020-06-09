#!/usr/bin/env zsh

dark-mode

sleep 0.1

if [[ "$(dark-mode status)" == 'off' ]]; then
  echo "DARK TO LIGHT"
  # Alacritty
  sed -i '' -- 's/*dark/*light/g' ~/.dotfiles/config/alacritty/alacritty.yml
  # Kitty
  # kitty @ --to unix:/tmp/mykitty set-colors --configured --all ~/.config/kitty/light_theme.conf
  sed -i '' -- 's/dark/light/g' ~/.config/kitty/theme.conf
else
  echo "LIGHT TO DARK"
  # Alacritty
  sed -i '' -- 's/*light/*dark/g' ~/.dotfiles/config/alacritty/alacritty.yml
  # Kitty
  # kitty @ --to unix:/tmp/mykitty set-colors --configured --all ~/.config/kitty/dark_theme.conf
  sed -i '' -- 's/light/dark/g' ~/.config/kitty/theme.conf
fi
