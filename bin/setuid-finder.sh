#!/bin/bash
#
# find systemwide setuid executables, without 'permission denied' spam
# aerth <aerth@riseup.net>

FOUND=$(find / -xdev \( -perm -4000 \) -type f -print0 2>&1 | grep -v denied)
if [ -z "$FOUND" ]; then
echo no setuid binaries found
exit 0
fi
ls -l "$FOUND"
