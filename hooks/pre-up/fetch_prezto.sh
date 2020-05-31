if [ -d "${ZDOTDIR:-$HOME}/.zprezto" ] 
then
  cd "${ZDOTDIR:-$HOME}/.zprezto"
  git pull --quiet
else
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" --quiet
fi
