#!/bin/sh

# disable bell
xset b 0 0

# white background
xsetroot -solid "#ffffff"

# disable screen sleep
xset -dpms
xset s off

if [ -f /run/archiso/bootmnt/kiosk.sh ]; then
    cp /run/archiso/bootmnt/kiosk.sh ~/kiosk.sh
fi

if [ -f ~/kiosk.sh ]; then
    sh -x ~/kiosk.sh 2> ~/kiosk.log
fi

KIOSK_HOMEPAGE=$(cat ~/homepage)

while true
do
	if test -x /usr/bin/chromium
	then
		rm -rf $HOME/.cache/
        chromium --kiosk --no-first-run $KIOSK_HOMEPAGE
		rm -rf $HOME/.cache/
	fi

	rm -rf $HOME/.adobe
	rm -rf $HOME/.macromedia
	rm -rf $HOME/Downloads
done
