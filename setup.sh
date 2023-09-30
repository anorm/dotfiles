#!/bin/bash

set -e

MODULES=()

MODULES+=('anorm-utils')
MODULES+=('bash')
MODULES+=('ddgr')
#MODULES+=('docker-compose')
MODULES+=('git')
MODULES+=('googler')
MODULES+=('helmfile')
MODULES+=('k9s')
MODULES+=('kubectl')
MODULES+=('liquidprompt')
MODULES+=('mega-upgrade')
MODULES+=('other')
MODULES+=('silversearcher')
MODULES+=('taskwarrior')
MODULES+=('terraform')
MODULES+=('tmux')
MODULES+=('vim')

if grep -q Microsoft /proc/version 2>/dev/null; then
    MODULES+=('docker-cli')
    MODULES+=('wsl')
    MODULES+=('xclip-xsel-wsl')
fi

if [[ $EUID -eq 0 ]]; then
    echo "This script must be run as you, not root" 1>&2
    exit 1
fi

# pre-apt.sh
for MODULE in "${MODULES[@]}"; do
    PREAPT=modules/$MODULE/pre-apt.sh
    if [ -x $PREAPT ]; then
        echo "* Executing $PREAPT"
        $PREAPT
    fi
done

sudo apt update

# Install prerequisite packages
for MODULE in "${MODULES[@]}"; do
    cat modules/$MODULE/packages.apt 2>/dev/null || true
done | sort -u | xargs sudo apt install -y

# Run module setup scripts
for MODULE in "${MODULES[@]}"; do
    [ -e modules/$MODULE/setup.sh ] && echo -e "============================\n      $MODULE\n============================" && modules/$MODULE/setup.sh
done
