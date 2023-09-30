#!/bin/bash
set -e
DIR="$( cd "$( dirname "$BASH_SOURCE" )" && pwd )"

mkdir -p ~/bin ~/.bashrc.d

ln -fs $DIR/ku ~/bin/
ln -fs $DIR/ku-complete.bashrc ~/.bashrc.d/
