#!/bin/bash
systemctl enable ModemManager
systemctl start ModemManager

mount /dev/sda /vrs
wait
case "$(curl -s --max-time 2 -I https://github.com | sed 's/^[^ ]*  *\([0-9]\).*/\1/; 1q')" in
[23])
	cd /home/yian/yian_Fence_1110/build-BigTruckDetector-unknown-Release/
	wget https://github.com/a5372935/updateExecutable/blob/main/mcmd.nano?raw=true -O mcmd.nano
	chmod 777 mcmd.nano
	wait
	cd /home/yian/FenceControl_0304/build-http_FenceControl-unknown-Release
	wget https://github.com/a5372935/updateExecutable/blob/main/mcmd.nano?raw=true -O mcmd.nano
	chmod 777 mcmd.nano
	wait
	chmod 777 /dev/ttyUSB0
	wait
	echo "update successful!"
	wait
	gnome-terminal -- /home/yian/monitorRestartFenceControl.sh
	/home/yian/monitorRestart.sh
;;
*)
	gnome-terminal -- /home/yian/monitorRestartFenceControl.sh
	/home/yian/monitorRestart.sh
;;
esac

