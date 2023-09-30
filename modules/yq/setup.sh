#!/bin/bash
set -e


meta=$(mktemp)
curl -sSL "https://api.github.com/repos/mikefarah/yq/releases/latest" > $meta
version="$(jq -er .tag_name $meta)"
filename="yq_linux_amd64.tar.gz"
url="$(jq -er ".assets[] | select(.name == \"$filename\") | .browser_download_url" $meta)"
install_dir=~/bin/$(basename $filename .tar.gz)/$version
if [ ! -e $install_dir ]; then
    echo "Downloading $url to $install_dir"
    mkdir -p $install_dir
    curl -sSL $url | tar xzf - -C $install_dir
else
    echo "Using existing $install_dir"
fi

echo "Making symlink ~/bin/yq -> $install_dir/$filename"
ln -sf $install_dir/$(basename $filename .tar.gz) ~/bin/yq

echo Done
