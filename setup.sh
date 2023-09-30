#!/bin/bash

set -e

MODULES=()

MODULES+=('anorm-utils')
MODULES+=('bash')
MODULES+=('ddgr')
MODULES+=('docker-compose')
MODULES+=('git')
MODULES+=('googler')
MODULES+=('liquidprompt')
MODULES+=('mega-upgrade')
MODULES+=('other')
MODULES+=('silversearcher')
MODULES+=('taskwarrior')
MODULES+=('tmux')
MODULES+=('vim')

if grep -q Microsoft /proc/version 2>/dev/null; then
    MODULES+=('docker-cli')
    MODULES+=('wsl')
    MODULES+=('xclip-xsel-wsl')
fi

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Install prerequisite packages
for MODULE in "${MODULES[@]}"; do
    cat modules/$MODULE/packages.apt 2>/dev/null || true
done | sort -u | xargs apt install -y

# Run module setup scripts
for MODULE in "${MODULES[@]}"; do
    [ -e modules/$MODULE/setup.sh ] && modules/$MODULE/setup.sh
done
