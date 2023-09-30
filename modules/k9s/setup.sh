#!/bin/bash
set -e
DIR="$( cd "$( dirname "$BASH_SOURCE" )" && pwd )"

meta=$(mktemp)
curl -sSL "https://api.github.com/repos/derailed/k9s/releases/latest" > $meta
version="$(jq -er .tag_name $meta)"
filename="k9s_$(uname -s)_$(uname -m).tar.gz"
url="$(jq -er ".assets[] | select(.name == \"$filename\") | .browser_download_url" $meta)"
install_dir=~/bin/$(basename $filename .tar.gz)/$version
if [ ! -e $install_dir ]; then
    echo "Downloading $url to $install_dir"
    mkdir -p $install_dir
    curl -sSL $url | tar xzf - -C $install_dir
else
    echo "Using existing $install_dir"
fi

echo "Making symlink ~/bin/k9s -> $install_dir/k9s"
ln -sf $install_dir/k9s ~/bin/k9s

echo "Installing k9"
ln -fs $DIR/k9 ~/bin/
echo "Installing k9 bash completion"
ln -fs $DIR/k9-complete.bashrc ~/.bashrc.d/

echo Done
