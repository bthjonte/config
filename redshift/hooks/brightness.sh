#!/bin/sh

# Set brightness via xbrightness when redshift status changes

# Set brightness values for each status.
# Range from 1 to 100 is valid
brightness_day="100"
brightness_transition="50"
brightness_night="30"
# Set fade time for changes to one minute
fade_time=190000

case $1 in
	period-changed)
		case $3 in
			night)
				sudo light -S $brightness_night
				;;
			transition)
				sudo light -S $brightness_transition
				;;
			daytime)
				sudo light -S $brightness_day
				;;
		esac
		;;
esac
