#!/bin/sh
set -e
mkdir -p $HOME/bin || true
mkdir -p $HOME/sbin || true
mkdir -p $HOME/rc.d || true
set -o noclobber
ln -s ./bin/* $HOME/bin/
ln -s ./sbin/* $HOME/sbin/
ln -s ./rc.d/* $HOME/rc.d/
echo "Installed."
