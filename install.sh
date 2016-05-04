#!/bin/sh
## For useful scripts
set -e

if test "$1" = "upgrade"; then

echo Upgrading.

exit 0
fi


SHBIN=$HOME
echo aerth\'s toolbox

echo && echo v99.8 "A new thing"
echo && echo " . . . . . . . . . . . ."
echo && echo installing these new tools:
ls -ACx ./bin ./sbin ./rc.d
echo $(date) >> uninstall
echo $(ls -ACx ./bin) >> uninstall
echo $(ls -ACx ./sbin) >> uninstall
echo $(ls -ACx ./rc.d) >> uninstall
echo "###" >> uninstall
echo $(ls -c ./bin)
echo $(ls -c ./sbin)
echo $(ls -c ./rc.d)
echo . . . . . . . . . . . .
echo Continue? Type yes
read CONTINUE
if test $CONTINUE = yes; then
echo Doing it.
else
echo Leaving...
exit 1
fi


echo mkdir -p $SHBIN/bin || true
mkdir -p $SHBIN/bin || true
## For sudo scripts
echo mkdir -p $SHBIN/sbin || true
mkdir -p $SHBIN/sbin || true
## For user-level system switches
echo mkdir -p $SHBIN/rc.d || true
mkdir -p $SHBIN/rc.d || true

for i in $(ls ./bin); do
echo ln -s $(pwd)/bin/$i $SHBIN/bin/$i || true
ln -s $(pwd)/bin/$i $SHBIN/bin/$i || true
done

for i in $(ls ./sbin); do
echo ln -s $(pwd)/sbin/$i $SHBIN/sbin/$i || true
ln -s $(pwd)/sbin/$i $SHBIN/sbin/$i || true
done

for i in $(ls ./rc.d); do
echo ln -s $(pwd)/rc.d/$i $SHBIN/rc.d/$i || true
ln -s $(pwd)/rc.d/$i $SHBIN/rc.d/$i || true
done;

echo "Installed. You can update this repo with 'git pull origin 
master' to upgrade, or use '$0 upgrade'."
echo "Adding to path..."
echo "PATH=$SHBIN/bin:$PATH" >> ~/.bashrc
echo "PATH=$SHBIN/bin:$PATH" >> ~/.profile
echo "PATH=$SHBIN/bin:$PATH" >> ~/.zshrc
echo Goodbye!
exit 0

