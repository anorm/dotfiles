#!/bin/bash
set -e

if [ ! -z "$1" ]; then
    version="$1"
else
    version=$(curl -L -s https://dl.k8s.io/release/stable.txt)
fi

url="https://dl.k8s.io/release/$version/bin/linux/amd64/kubectl"
filename=kubectl
install_dir=~/bin/$(basename $filename)-all/$version

if [ ! -e $install_dir ]; then
    echo "Downloading $url to $install_dir"
    mkdir -p $install_dir
    curl -fsSL $url > $install_dir/$filename
    chmod +x $install_dir/$filename
else
    echo "Using existing $install_dir"
fi

echo "Making symlink ~/bin/$filename -> $install_dir/$filename"
ln -sf $install_dir/$filename ~/bin/$filename

echo Done
