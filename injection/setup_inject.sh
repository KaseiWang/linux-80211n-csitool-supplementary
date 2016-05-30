#!/usr/bin/sudo /bin/bash
modprobe -r iwldvm iwlwifi mac80211 cfg80211
modprobe iwlwifi debug=0x40000
iw dev wlp3s0 interface add mon0 type monitor
ip link set wlp3s0 down
ip link set mon0 up
iw mon0 set channel $1 $2
ip link set mon0 up
