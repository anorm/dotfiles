#!/bin/bash

set -e

MODULES=()

MODULES+=('anorm-utils')
MODULES+=('docker-compose')
MODULES+=('git')
MODULES+=('mega-upgrade')
MODULES+=('other')
MODULES+=('silversearcher')
MODULES+=('taskwarrior')
MODULES+=('tmux')
MODULES+=('vim')

if grep -q Microsoft /proc/version 2>/dev/null; then
    MODULES+=('docker-cli')
    MODULES+=('wsl')
fi

# Install prerequisite packages
for MODULE in "${MODULES[@]}"; do
    cat modules/$MODULE/packages.apt 2>/dev/null
done | sort -u | sudo xargs apt install -y

# Run module setup scripts
for MODULE in "${MODULES[@]}"; do
    [ -e modules/$MODULE/setup.sh ] && modules/$MODULE/setup.sh
done
