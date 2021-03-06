#!/bin/bash

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=5

# load colors
. ~/.config/suckless/dwm-gaps-eww/bar_themes/catppuccin

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

  printf "^c$black^ ^b$green^ cpu"
  printf "^c$white^ ^b$grey^ $cpu_val"
}

mem() {
  printf "^c$black^^b$white^ ram "
  printf "^c$white^^b$grey^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

clock() {
	printf "^c$black^ ^b$darkblue^ time "
	printf "^c$white^^b$grey^ $(date '+%H:%M')"
}

volume() {
  volume=$(pamixer --get-volume)

  printf "^c$grey^^b$red^ vol "
  printf "^c$white^^b$grey^ $volume "
}

gputemp() {
  temp="$(sensors | grep "junction" | awk '{print $2}')"
  temp="${temp:1}"

  printf "^c$black^^b$yellow^ gpu "
  printf "^c$white^^b$grey^ $temp"
}

dwm_spotify () {
	    if ps -C spotify > /dev/null; then
	        PLAYER="spotify"
	    elif ps -C spotifyd > /dev/null; then
	        PLAYER="spotifyd"
	    fi
	
	    if [ "$PLAYER" = "spotify" ] || [ "$PLAYER" = "spotifyd" ]; then
	        ARTIST=$(playerctl metadata --player=spotifyd artist)
	        TRACK=$(playerctl metadata --player=spotifyd title)
	        POSITION=$(playerctl position --player=spotifyd | sed 's/..\{6\}$//')
	        DURATION=$(playerctl metadata mpris:length --player=spotifyd | sed 's/.\{6\}$//')
	        STATUS=$(playerctl status --player=spotifyd)
	        SHUFFLE=$(playerctl shuffle --player=spotifyd)
	
	        if [ "$IDENTIFIER" = "unicode" ]; then
	            if [ "$STATUS" = "Playing" ]; then
	                STATUS="▶"
	            else
	                STATUS="⏸"
	            fi
	            
	            if [ "$SHUFFLE" = "On" ]; then
	                SHUFFLE=" 🔀"
	            else
	                SHUFFLE=""
	            fi
	        else
	            if [ "$STATUS" = "Playing" ]; then
	                STATUS="PLA"
	            else
	                STATUS="PAU"
	            fi
	
	            if [ "$SHUFFLE" = "On" ]; then
	                SHUFFLE=" S"
	            else
	                SHUFFLE=""
	            fi
	        fi
	        
	        if [ "$PLAYER" = "spotifyd" ]; then
	            printf "^c$black^ ^b$green^%s%s %s - %s" "$SEP1" "$STATUS" "$ARTIST" "$TRACK"
	            printf " | %0d:%02d " $((DURATION%3600/60)) $((DURATION%60))
	            printf "%s\n" "$SEP2"
	        else
	            printf "%s%s %s - %s " "$SEP1" "$STATUS" "$ARTIST" "$TRACK"
	            printf "%0d:%02d/" $((POSITION%3600/60)) $((POSITION%60))
	            printf "%0d:%02d" $((DURATION%3600/60)) $((DURATION%60))
	            printf "%s%s\n" "$SHUFFLE" "$SEP2"
	        fi
	    fi
	}

while true; do

  [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ]
  interval=$((interval + 1))

  sleep 1 && xsetroot -name "$(cpu) $(mem) $(clock) $(volume) $(gputemp) $(dwm_spotify)"
done
