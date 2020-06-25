#!/bin/bash
URL=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r ".assets[].browser_download_url | select((. | contains(\"$(uname -s)-$(uname -m)\")) and (. | contains(\"sha256\") | not))")
sudo curl -L $URL -o /usr/local/bin/docker-compose
sudo chmod 755 /usr/local/bin/docker-compose
