#!/bin/bash
set -e

REPO_NAME=hashicorp
REPO_URL=https://apt.releases.hashicorp.com
KEY_URL=https://apt.releases.hashicorp.com/gpg
KEYRING_DIR=/usr/share/keyrings
KEYRING_KEY=$KEYRING_DIR/$REPO_NAME-archive-keyring.gpg
SOURCES_FILE=/etc/apt/sources.list.d/$REPO_NAME.list

if ! grep -Rq $REPO_URL /etc/apt/sources*; then
    curl -fsSL $KEY_URL | gpg --dearmor | sudo tee $KEYRING_KEY >/dev/null
    echo "deb [arch=amd64] $REPO_URL $(lsb_release -cs) main" | sudo tee $SOURCES_FILE
fi
