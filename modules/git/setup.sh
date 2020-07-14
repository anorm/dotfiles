#!/bin/bash

set -e

if ! git config --global --get user.email >/dev/null; then
    echo -n 'Enter email address to use for ~/.gitconfig: '
    read email
    git config --global user.email $email
fi

if ! git config --global --get user.name >/dev/null; then
    echo -n 'Enter name to use for ~/.gitconfig: '
    read name
    git config --global user.name "$name"
fi

if ! git config --global --get alias.st >/dev/null; then
    git config --global alias.st "status -bs"
fi

LINE='.*.swp'
grep -qxF "$LINE" ~/.gitignore 2> /dev/null || echo "$LINE" >> ~/.gitignore
git config --global core.excludesfile ~/.gitignore
