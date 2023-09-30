#!/bin/bash
DIR="$( cd "$( dirname "$BASH_SOURCE" )" && pwd )"

ln -fs $DIR/.tmux.conf ~

THEMEDIR=$DIR/tmux-themepack
if [ ! -e $THEMEDIR ]; then
    git clone https://github.com/jimeh/tmux-themepack.git $THEMEDIR
fi
ln -fs $THEMEDIR ~/.tmux-themepack

mkdir -p ~/bin
ln -fs $DIR/link_ssh_auth_sock.sh ~/bin/
