#!/bin/bash
DIR="$( cd "$( dirname "$BASH_SOURCE" )" && pwd )"

GITDIR=$DIR/source

if [ ! -d $GITDIR ]; then
    git clone https://github.com/anorm/anorm-utils.git $GITDIR
fi

cd $GITDIR
git pull
rm -rf build
mkdir build
cd build
cmake ..
make

ln -sf $GITDIR/build/word ~/bin/ 
