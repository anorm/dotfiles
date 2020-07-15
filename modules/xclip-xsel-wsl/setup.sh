#!/bin/bash
set -e
DIR="$( cd "$( dirname "$BASH_SOURCE" )" && pwd )"

GIT_URL=https://github.com/Konfekt/xclip-xsel-WSL.git
GIT_DIR=$DIR/git
if [ ! -e $GIT_DIR ]; then
    git clone $GIT_URL $GIT_DIR
fi
mkdir -p ~/bin
ln -fs $DIR/git/clip.sh ~/bin/xclip
ln -fs $DIR/git/clip.sh ~/bin/xsel
