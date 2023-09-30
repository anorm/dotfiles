#!/bin/bash

DIR="$( cd "$( dirname "$BASH_SOURCE" )" && pwd )"

cp $DIR/wsl.conf /etc
chmod 644 /etc/wsl.conf
