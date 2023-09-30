#!/bin/bash
set -e
meta=$(mktemp)
curl -sSL "https://api.github.com/repos/roboll/helmfile/releases/latest" > $meta
version="$(jq -er .tag_name $meta)"
filename="helmfile_linux_amd64"
url="$(jq -er ".assets[] | select(.name == \"$filename\") | .browser_download_url" $meta)"
install_dir=~/bin/$(basename $filename .tar.gz)/$version
if [ ! -e $install_dir ]; then
    echo "Downloading $url to $install_dir"
    mkdir -p $install_dir
    curl -sSL $url > $install_dir/$filename
    chmod +x $install_dir/$filename
else
    echo "Using existing $install_dir"
fi

echo "Making symlink ~/bin/helmfile -> $install_dir/$filename"
ln -sf $install_dir/$filename ~/bin/helmfile

echo Done
