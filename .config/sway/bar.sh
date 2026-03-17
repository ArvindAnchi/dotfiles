#!/bin/sh

common() {
    echo -n "{"
    echo -n "\"separator_block_width\":0,"
    echo -n "\"color\":\"#A5A5A5\","
    echo -n "\"background\":\"$bg\","
    echo -n "\"name\":\"$name\","
    echo -n "\"full_text\":\" $stat\","
    echo -n "},"
}

battery0() {
    local bg="#262626"
    local name="battery0"
    prct=$(cat /sys/class/power_supply/BAT0/capacity)
    chrg=$(cat /sys/class/power_supply/BAT0/status)
    icon=""
    case $chrg in
        "Charging")  icon+="↥";bg="#000044"; ;;
        "Discharging") icon+="↧" ;bg="#440000" ;;
        "Full") icon+="⇭"; bg="ffff00" ;;
    esac 
    local stat=BAT\ $prct%$icon\ 
    common
}

ipaddr() {
    local bg="#262626"
    local name="ip_addr"
    local state=$(iwctl station wlan0 show | grep 'State' | awk -F ' ' '{print $3}')
    local ssid=$(iwctl station wlan0 show | grep 'network' | awk -F ' ' '{print $3}')
    local stat=$state:$ssid\ 
    common
}

mydate() {
    local bg="#262626"
    local name="id_time"
    local stat=$(date "+%a %d %b %H:%M")\ 
    common
}

echo '{ "version": 1 , "click_events":false}'
echo '[[],'

while :
do
    echo -n "["
    ipaddr 
    mydate
    battery0
    echo -n "],"
    sleep 60
done
