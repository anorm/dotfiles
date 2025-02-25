#!/bin/bash

set -eu

DIR="$( cd "$( dirname "$BASH_SOURCE" )" && pwd )"

# Loop over all 'dotfiles' directories
while read MODULE_DOTFILES; do
    echo "Installing dotfiles: $MODULE_DOTFILES"
    (
        # Enter the dotfile directory
        cd $MODULE_DOTFILES

        # Loop over all files and symlinks
        while read FILENAME; do
            DIRNAME="$(dirname $FILENAME)"
            FILENAME="${FILENAME:2}"
            mkdir -p "${HOME}/$DIRNAME"
            echo "  ~/$FILENAME"

            # Does the target already exist?
            if [[ -e "${HOME}/$FILENAME" ]]; then
                # Make sure it's not a regular file
                if [[ ! -L "${HOME}/$FILENAME" ]]; then
                    echo -e "\033[0;31mERROR: ~/$FILENAME already exists and is not a symlink\033[0m"
                    exit 1
                fi

                # Delete the old link (this must be done explicitly, otherwise, the new
                # symlink will be created _inside_ the target if the target is a
                # directory)
                rm "${HOME}/$FILENAME"
            fi

            # Create the symlink
            ln -fs "$DIR/$MODULE_DOTFILES/$FILENAME" "${HOME}/$FILENAME"
        done < <(find . -not -type d)
    )
done < <(find modules -type d -maxdepth 2 -name dotfiles)
