#!/bin/bash
set -e
curl -sL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main"
sudo apt-get update
sudo apt-get install azure-cli
