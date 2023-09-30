FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

autoload -Uz compinit
compinit

setopt noautomenu


if [ -d ~/.zshrc.d ]; then
  for i in ~/.zshrc.d/*; do
    source $i
  done
  unset i
fi
