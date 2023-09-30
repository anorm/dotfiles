#!/bin/bash
set -e
DIR="$( cd "$( dirname "$BASH_SOURCE" )" && pwd )"

GIT_URL=https://github.com/nojhan/liquidprompt.git
GIT_DIR=$DIR/git
if [ ! -e $GIT_DIR ]; then
    git clone --branch stable $GIT_URL $GIT_DIR
fi
mkdir -p ~/.bashrc.d
echo "source $DIR/git/liquidprompt" > ~/.bashrc.d/liquidprompt_load.bashrc
ln -sf $DIR/liquidprompt_config.bashrc ~/.bashrc.d/liquidprompt_config.bashrc
