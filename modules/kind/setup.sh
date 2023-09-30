#!/bin/bash
set -eux
module=kind
meta=$(mktemp)
curl -sSL "https://api.github.com/repos/kubernetes-sigs/kind/releases/latest" > $meta
version="$(jq -er .tag_name $meta)"
filename="kind-linux-amd64"
url="$(jq -er ".assets[] | select(.name == \"$filename\") | .browser_download_url" $meta)"
install_dir=~/bin/.$module/$version
if [ ! -e $install_dir ]; then
    echo "Downloading $url to $install_dir"
    mkdir -p $install_dir
    curl -sSL -o $install_dir/$filename $url
    chmod +x $install_dir/$filename
else
    echo "Using existing $install_dir"
fi

echo "Making symlink ~/bin/$module -> $install_dir/$filename"
ln -sf $install_dir/$filename ~/bin/$module

echo Done
