#!/bin/dash

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=0

# load colors
. ~/.config/dwm/bar_themes/gruvchad

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

  printf "^c$black^ ^b$green^ CPU"
  printf "^c$white^ ^b$grey^ $cpu_val"
}

volume() {
  volume=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))
  printf "^c$black^ ^b$yellow^ Vol"
  printf "^c$white^ ^b$grey^ $volume%"
}

# Cpu Temp :
# tmp(){
# 	ctmp=$(sensors | awk '/Core 0/ {print$3}' | sed 's/+//')
# 	echo -e "^c$red^^c$black^^b$red^  $ctmp "
# }

battery() {
  get_capacity="$(cat /sys/class/power_supply/BAT0/capacity)"
  printf "^c$blue^   $get_capacity"
}

brightness() {
  printf "^c$red^   "
  printf "^c$red^%.0f\n" $(xbacklight -get | sed 's/\..*//g')
}

lang() {
    lang_val=$(setxkbmap -query | grep layout | awk '{print $2}')
    printf "^c$black^^b$red^ "
    printf "^c$red^ ^b$black^ $lang_val "
}

mem() {
  printf "^c$blue^^b$black^  "
  printf "^c$blue^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

wlan() {
  ssid="$(LANG=C nmcli -t -f active,ssid dev wifi | grep ^yes | cut -d: -f2-)"
	case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
	up) printf "^c$black^ ^b$blue^  ^d^%s" " ^c$blue^$ssid" ;;
	down) printf "^c$black^ ^b$blue^ ﲁ ^d^%s" " ^c$blue^Disconnected" ;;
	esac
}

# Network traffic
# nettrf(){
# 
# 	update() {
# 		sum=0
# 		for arg; do
# 			read -r i < "$arg"
# 			sum=$(( sum + i ))
# 		done
# 		cache=${XDG_CACHE_HOME:-$HOME/.cache}/${1##*/}
# 		[ -f "$cache" ] && read -r old < "$cache" || old=0
# 		printf %d\\n "$sum" > "$cache"
# 		printf %d\\n $(( sum - old ))
# 	}
#
# 	rx=$(update /sys/class/net/[ew]*/statistics/rx_bytes)
# 	tx=$(update /sys/class/net/[ew]*/statistics/tx_bytes)
#
# 	printf "^c$magenta^^b$magenta^^c$black^ ^c$black^^b$magenta^ %4sB ^b$magenta^^c$black^ ^c$black^^b$magenta^ %4sB \\n" $(numfmt --to=iec $rx) $(numfmt --to=iec $tx)	
# }

clock() {
	printf "^c$black^ ^b$darkblue^  "
	printf "^c$black^^b$blue^ $(date '+%H:%M')  "
}

while true; do

  # [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] && updates=$(pkg_updates)
  # interval=$((interval + 1))

  sleep 1 && xsetroot -name "$(battery) $(cpu) $(mem) $(volume) $(brightness) $(wlan) $(lang) $(clock)"
done
