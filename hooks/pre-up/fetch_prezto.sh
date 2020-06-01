if [ -d "${ZDOTDIR:-$HOME}/.zprezto" ] 
then
  cd "${ZDOTDIR:-$HOME}/.zprezto"
  git pull --quiet
fi
