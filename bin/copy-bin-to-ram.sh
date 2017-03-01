#!/bin/sh
# aerth <aerth@riseup.net>
# copy local bin to RAM for speed
# useful for slow USB installations
#
# does not require root permission
#####################################
NEWBIN=/tmp/aerth-bin/
echo "$NEWBIN"
# do this once

hud(){
	HOSTNAME=`hostname`
	echo welcome back to $HOSTNAME, $USER
	uname -a
	top -n 1 -b | sed 3q
}

if [ -d "$NEWBIN" ]; then
	hud
	export PATH=$NEWBIN:$PATH
	return 0
fi

echo creating "$NEWBIN"
mkdir -p "$NEWBIN"

# copy to RAM (assuming /tmp is tmpfs!)
# /bin/
echo 'copying /bin/ (following links)'
cp -v -L -a /bin/* "$NEWBIN"


# $HOME/bin
if [ -d $HOME/bin ]; then
	echo 'copying $HOME/bin'
	cp -v -L "$HOME"/bin/* "$NEWBIN"
fi

# $HOME/sh
if [ -d $HOME/sh ]; then
	echo 'copying $HOME/sh'
	cp -v -L "$HOME"/bin/* "$NEWBIN"
fi

# pick RAM bin first
export PATH=$NEWBIN:$PATH
hud
return 0
