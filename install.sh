#!/bin/sh
## For useful scripts
set -e
SHBIN=$HOME
echo installing these new tools:
ls -ACx ./bin ./sbin ./rc.d
echo $(date) >> uninstall
echo $(ls -ACx ./bin) >> uninstall
echo $(ls -ACx ./sbin) >> uninstall
echo $(ls -ACx ./rc.d) >> uninstall
echo "###" >> uninstall
echo $(ls -c ./bin)
echo $(ls -c ./sbin)
echo $(ls -c ./rc.d)
sleep 5
echo 5 4 3 2 1
mkdir -p $SHBIN/bin || true
## For sudo scripts
mkdir -p $SHBIN/sbin || true
## For user-level system switches
mkdir -p $SHBIN/rc.d || true

for i in $(ls ./bin); do
ln -s $(pwd)/bin/$i $SHBIN/bin/$i || true
done

for i in $(ls ./sbin); do
ln -s $(pwd)/sbin/$i $SHBIN/sbin/$i || true
done

for i in $(ls ./rc.d); do
ln -s $(pwd)/rc.d/$i $SHBIN/rc.d/$i || true
done;

echo "Installed."
echo "Adding to path..."
echo "PATH=$SHBIN/bin:$PATH" >> ~/.bashrc
echo "PATH=$SHBIN/bin:$PATH" >> ~/.profile
echo "PATH=$SHBIN/bin:$PATH" >> ~/.zshrc
echo Goodbye!
exit 0

