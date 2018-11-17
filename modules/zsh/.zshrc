export PATH=~/bin:/usr/lib/ccache:$PATH
export EDITOR=vi

# Load antigen from somewhere
if [ -f /usr/local/share/antigen/antigen.zsh ]; then
    source /usr/local/share/antigen/antigen.zsh
elif [ -f /usr/share/zsh-antigen/antigen.zsh ]; then
    source /usr/share/zsh-antigen/antigen.zsh
else
    if [ ! -f $HOME/antigen.zsh ]; then
        curl -L git.io/antigen > $HOME/antigen.zsh
    fi
    source $HOME/antigen.zsh
fi

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle fasd
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship

# Tell Antigen that you're done.
antigen apply

SPACESHIP_DIR_COLOR="blue"
SPACESHIP_GIT_STATUS_DIVERGED="$SPACESHIP_GIT_STATUS_AHEAD$SPACESHIP_GIT_STATUS_BEHIND"
SPACESHIP_HOST_SHOW="false"
SPACESHIP_USER_SHOW="false"

zstyle ':completion:*:*' ignored-patterns '*ORIG_HEAD'

DISABLE_AUTO_TITLE="true"

unsetopt share_history

if [ -S "$SSH_AUTH_SOCK" ] && [ ! -L "$SSH_AUTH_SOCK" ]; then
    ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
