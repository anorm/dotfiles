#!/bin/bash
# Inspired by https://medium.com/@earlybyte/powerline-for-bash-6d3dd004f6fc

set -e

DIR="$( cd "$( dirname "$BASH_SOURCE" )" && pwd )"
pip3 install --user powerline-status powerline-gitstatus
mkdir -p ~/.config/
rm -f ~/.config/powerline
ln -sf $DIR/config_files ~/.config/powerline

mkdir -p ~/.bashrc.d
ln -fs $DIR/powerline.bashrc ~/.bashrc.d/
