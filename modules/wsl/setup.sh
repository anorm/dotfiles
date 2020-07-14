#!/bin/bash

DIR="$( cd "$( dirname "$BASH_SOURCE" )" && pwd )"

sudo cp $DIR/wsl.conf /etc
sudo chmod 644 /etc/wsl.conf
