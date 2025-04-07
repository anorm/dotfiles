#!/bin/bash
set -eu

if [ ! -d ~/Library/Fonts ]; then
    echo "Directory ~/Library/Fonts not found"
    exit 1
fi

WORKDIR=$(mktemp -d)
cd $WORKDIR
echo "Working directory: $WORKDIR"

while read url; do
    echo "Downloading: $url..."
    curl -L -O --fail --silent --show-error $url
done < <(curl -s 'https://api.github.com/repos/be5invis/Iosevka/releases/latest' \
            | jq -r ".assets[] | .browser_download_url" \
            | grep PkgTTC-Iosevka)

mkdir unpack
cd unpack
ls ../*.zip | xargs -n1 unzip

echo Installing fonts...
mv *.ttc ~/Library/Fonts

echo Cleaning up...
rm -rf $WORKDIR

echo Done
