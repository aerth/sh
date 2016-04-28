#!/bin/sh
set -e
mkdir -p $HOME/bin || true
mkdir -p $HOME/sbin || true
mkdir -p $HOME/rc.d || true
set -o noclobber
cp ./bin/* $HOME/bin/
cp ./sbin/* $HOME/sbin/
cp ./rc.d/* $HOME/rc.d/
echo "Installed."
