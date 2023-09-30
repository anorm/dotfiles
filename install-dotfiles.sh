#!/bin/bash

set -eu

DIR="$( cd "$( dirname "$BASH_SOURCE" )" && pwd )"

while read MODULE_DOTFILES; do
    echo "Installing dotfiles: $MODULE_DOTFILES"
    (
        cd $MODULE_DOTFILES
        while read FILENAME; do
            DIRNAME=$(dirname $FILENAME)
            FILENAME=${FILENAME:2}
            mkdir -p ~/$DIRNAME
            echo "  ~/$FILENAME"
            ln -sf $DIR/$MODULE_DOTFILES/$FILENAME ~/$FILENAME
        done < <(find . -not -type d)
    )
done < <(find modules -type d -maxdepth 2 -name dotfiles)
