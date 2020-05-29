fish_vi_key_bindings

# don't show vi mode prompt ([I], [N], etc)
function fish_mode_prompt
end

set fish_greeting ""

# load the path files
for file in $HOME/.config/**/*.fish
  if echo "$file" | grep -q -E 'fish/config.fish'
  else
    source $file
  end
end

set -x EDITOR nvim
function edit
  eval $EDITOR $argv
end

function iterm_dark_colors
  echo -e "\033]50;SetProfile=Dark\a"
end

function iterm_light_colors:
  echo -e "\033]50;SetProfile=Light\a"
end

set -U -x PKG_CONFIG_PATH /usr/local/opt/openssl/lib/pkgconfig
set -U -x FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git -g ""'

set THEME (defaults read -g AppleInterfaceStyle > /dev/null ^ /dev/null ;and echo "dark" ;or echo "light")

set PATH $HOME/.composer/vendor/bin $PATH

function download_website
  wget -r -p -E -k $argv
end

# See terminfo folder
# set -x TERMINFO ~/.terminfo
if test -d ~/.asdf
  source ~/.asdf/asdf.fish
end
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
