#!/usr/bin/sudo /bin/bash
modprobe -r iwldvm iwlwifi mac80211 cfg80211
modprobe iwlwifi connector_log=0x1
iwconfig wlp3s0 mode monitor 2>/dev/null 1>/dev/null
while [ $? -ne 0 ]
do
	iwconfig wlp3s0 mode monitor 2>/dev/null 1>/dev/null
done
ip link set wlp3s0 up
iw dev wlp3s0 set channel $1 $2
ip link set wlp3s0 up
