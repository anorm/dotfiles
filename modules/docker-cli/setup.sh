#!/bin/bash

set -e

DIR="$( cd "$( dirname "$BASH_SOURCE" )" && pwd )"

mkdir -p ~/.bashrc.d
ln -fs $DIR/docker-cli.bashrc ~/.bashrc.d/

dpkg --get-selections | grep -q docker-ce-cli && exit

# Download and add Docker's official public PGP key.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add the `stable` channel's Docker upstream repository.
#
# If you want to live on the edge, you can change "stable" below to "test" or
# "nightly". I highly recommend sticking with stable!
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update the apt package list (for the new apt repo).
sudo apt-get update -y

# Install the latest version of Docker CE CLI.
sudo apt-get install -y docker-ce-cli
