# (re)start X
if [ -z "$DISPLAY" ] && [ $(tty) == /dev/tty1 ]; then
while true
do
  startx -- :1
done
fi
