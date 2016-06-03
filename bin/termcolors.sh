#!/bin/sh
# gutted from http://blog.z3bra.org/2013/10/home-sweet-home.html
# original: http://blog.z3bra.org/data/info.sh
# modified by: aerth
c00=$'\e[0;30m'
c01=$'\e[0;31m'
c02=$'\e[0;32m'
c03=$'\e[0;33m'
c04=$'\e[0;34m'
c05=$'\e[0;35m'
c06=$'\e[0;36m'
c07=$'\e[0;37m'
c08=$'\e[1;30m'
c09=$'\e[1;31m'
c10=$'\e[1;32m'
c11=$'\e[1;33m'
c12=$'\e[1;34m'
c13=$'\e[1;35m'
c14=$'\e[1;36m'
c15=$'\e[1;37m'
c99=$'\e[1;00m'

f0=$'\e[1;30m'
f1=$'\e[1;37m'
f2=$'\e[0;37m'

if [ -n "$DISPLAY" ]; then
    wmname=`xprop -root WM_NAME|cut -d\" -f2`
else
    wmname="none"
    termfn="none"
    systfn="none"
fi

cat << EOF
${c00}▉▉  |
${c08}  ▉▉|
${c01}▉▉  |
${c09}  ▉▉|
${c02}▉▉  |
${c10}  ▉▉|
${c03}▉▉  |
${c11}  ▉▉|
${c04}▉▉  |
${c12}  ▉▉|
${c05}▉▉  |
${c13}  ▉▉|
${c06}▉▉  |
${c14}  ▉▉|
${c07}▉▉  |
${c15}  ▉▉|
${c99}  ▉▉| Default Color
EOF
