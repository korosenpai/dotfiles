# num lock effect has not taken place yet and saved so wait
sleep 0.3

status=$(xset q | grep -oE "01: Num Lock:[ ]{1,20}o[fn]{1,2}" | grep -oE "o[fn]{1,2}")
notify-send "Num Lock: $status"
echo $status
