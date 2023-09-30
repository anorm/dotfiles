#!/bin/bash
set -e
meta=$(mktemp)
curl -sSL "https://api.github.com/repos/helm/helm/releases/latest" > $meta
version="$(jq -er .tag_name $meta)"
filename="helm-${version}-$(uname -s | tr '[:upper:]' '[:lower:]')-$(dpkg --print-architecture).tar.gz"
url="https://get.helm.sh/$filename"
install_dir=~/bin/.helm/$version
if [ ! -e $install_dir ]; then
    echo "Downloading $url to $install_dir"
    mkdir -p $install_dir
    curl -sSL $url | tar xzf - -C $install_dir --strip-components=1
else
    echo "Using existing $install_dir"
fi

echo "Making symlink ~/bin/helm -> $install_dir/helm"
ln -sf $install_dir/helm ~/bin/helm

echo Done
