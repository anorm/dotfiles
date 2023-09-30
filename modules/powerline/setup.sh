#!/bin/bash
# Inspired by https://medium.com/@earlybyte/powerline-for-bash-6d3dd004f6fc

set -e

DIR="$( cd "$( dirname "$BASH_SOURCE" )" && pwd )"
pip3 install --user powerline-status powerline-gitstatus
mkdir -p ~/.config/
rm -f ~/.config/powerline
ln -sf $DIR/config_files ~/.config/powerline

if ! grep -qF powerline.sh ~/.bashrc; then
    echo 'if [ -f ~/.local/lib/python3.*/site-packages/powerline/bindings/$(basename $SHELL)/powerline.sh ]; then' >> ~/.bashrc
    echo '    $HOME/.local/bin/powerline-daemon -q' >> ~/.bashrc
    echo '    POWERLINE_BASH_CONTINUATION=1' >> ~/.bashrc
    echo '    POWERLINE_BASH_SELECT=1' >> ~/.bashrc
    echo '    source ~/.local/lib/python3.*/site-packages/powerline/bindings/$(basename $SHELL)/powerline.sh' >> ~/.bashrc
    echo 'fi' >> ~/.bashrc
fi
