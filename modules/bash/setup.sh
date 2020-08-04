#!/bin/bash
set -e
DIR="$( cd "$( dirname "$BASH_SOURCE" )" && pwd )"

MARKER='db1bdbac-691a-4b0b-8c75-c66a13e0dd35'
grep -qF $MARKER ~/.bashrc || cat << EOF >> ~/.bashrc

# Include all files in .bashrd.d ($MARKER)
if [ -d ~/.bashrc.d ]; then
  for i in ~/.bashrc.d/*; do
    if [ -r \$i ]; then
      . \$i
    fi
  done
  unset i
fi

EOF
mkdir -p ~/.bashrc.d/
ln -fs $DIR/00-local-bin-paths.bashrc ~/.bashrc.d/
ln -fs $DIR/01-opts.bashrc ~/.bashrc.d/
