#!/bin/bash

set -e

MODULES=(vim tmux zsh silversearcher)

# Install prerequisite packages
for MODULE in "${MODULES[@]}"; do
    cat modules/$MODULE/packages.apt 2>/dev/null
done | sort -u | sudo xargs apt install -y

# Run module setup scripts
for MODULE in "${MODULES[@]}"; do
    modules/$MODULE/setup.sh
done
