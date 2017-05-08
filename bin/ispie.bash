#!/bin/bash
# ispie.bash - "Is $x PIE?"
# check a file if position independent executable (PIE)
# we check two different ways, using 'file' command, and 'readelf'
copyright_info(){
1>&2
cat 1>&2 << EOF
ispie.bash

(c) Copyright 2017 aerth@riseup.net

Permission is hereby granted, free of charge, to any person obtaining a 
copy of this software and associated documentation files (the 
"Software"), to deal in the Software without restriction, including 
without limitation the rights to use, copy, modify, merge, publish, 
distribute, sublicense, and/or sell copies of the Software, and to 
permit persons to whom the Software is furnished to do so, subject to 
the following conditions:

The above copyright notice and this permission notice shall be included 
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
EOF
}

print_usage(){
cat >&2 << EOF

USAGE
	ispie.bash [filename]
EOF
}

file_read(){
	E=$(which file 2>/dev/null)
	if [ -z "$E" ]; then
		return 111; # no 'file' magic
	fi
	OUT=$(file $1)
	if [ -z "$( echo "$OUT" | grep "LSB shared object" )" ]; then
		echo "file: $1 does not appear to be PIE" >&1
		return 111
	fi
	echo "file: $1 appears to be PIE" >&1
	return 0
}

elf_read(){
	if [ -z "$(readelf --relocs "$1" |\
		grep RELATIVE
	)" 1>/dev/null ]; then
		echo "readelf: $1 does not appear to be PIE" >&1
		return 111
	fi
	echo "readelf: $1 appears to be PIE" >&1
	return 0
}


copyright_info

ELF="$1"

if [ -z "$ELF" ]; then
	print_usage
	exit 111;
fi

if [ "$ELF" == "-" ]; then
	print_usage
	exit 111;
fi

file_read "$ELF"
elf_read "$ELF"
EXITCODE=$?
set -x
exit "$EXITCODE"