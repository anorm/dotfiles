FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

autoload -Uz compinit
compinit
autoload bashcompinit
bashcompinit

setopt noautomenu


if [ -d ~/.zshrc.d ]; then
  for i in ~/.zshrc.d/*; do
    source $i
  done
  unset i
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
