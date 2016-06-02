#!/bin/sh
set -e
unset CDPATH

STAGING=${STAGING:="/tmp/gostaging"}

if [ -d "$STAGING" ]; then
rm -Rf "$STAGING"
fi
mkdir -p $STAGING
cd $STAGING
# as root
if [ "`id -u`" = "0" ]; then
GOTARGET=/usr/local/
PROF=/etc/profile
PROF2=/etc/bashrc
else

GOTARGET=$HOME/.goroot
PROF=$HOME/.profile
PROF2=$HOME/.bashrc
fi



if [ ! -z $(which go) ]; then
echo you already have go installed.
exit 1
fi

GOTAR=${GOTAR:="go1.6.2.linux-amd64.tar.gz"}


if [ ! -f "$GOTAR" ]; then
wget https://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz -O $GOTAR
fi

echo "e40c36ae71756198478624ed1bb4ce17597b3c19d243f3f0899bb5740d56212a $GOTAR" | sha256sum -c

echo Extracting tar
tar xaf $GOTAR -C $HOME/.goroot
echo Adding to path via profile and bashrc
echo "$PATH"|grep -vq "/usr/local/go/bin" && echo PATH=/usr/local/go/bin:$PATH >> $PROF && echo PATH=/usr/local/go/bin:$PATH >> $PROF2
echo Sourcing
. /etc/profile

unset GOTAR

