#!/bin/sh
## Times the screen off and puts it to background
swayidle \
	timeout 100 'swaymsg "output * dpms off"' \
		resume 'swaymsg "output * dpms on"' &
#        # Locks the screen immediatly
swaylock -c 000000
#        # Kills last background task so idle timer doesn't keep running
#        kill %%
