#!/bin/bash
DIR="$( cd "$( dirname "$BASH_SOURCE" )" && pwd )"
ln -fs $DIR/.taskrc ~
ln -fs $DIR/.task ~
mkdir -p ~/.bashrc.d
ln -fs $DIR/taskwarrior.bashrc ~/.bashrc.d/
echo "INFO: Remember to copy your taskwarrior freecinc keys to ~/.task/ and do the necessary changes to ~/.task/taskd.conf."
