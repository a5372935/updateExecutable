#!/bin/sh
while true
do
case "$(curl -s --max-time 2 -I https://github.com | sed 's/^[^ ]*  *\([0-9]\).*/\1/; 1q')" in
[23])
	ps -ef | grep BigTruckDetector | grep -v "grep"
	if [ "$?" -eq 1 ]
	then
		cd /home/yian/yian_Fence_1110/build-BigTruckDetector-unknown-Release/
		wget https://github.com/a5372935/updateExecutable/blob/main/BigTruckDetector?raw=true -O BigTruckDetector
		chmod 777 BigTruckDetector
		echo "update successful!"
		wait
		/home/yian/yian_Fence_1110/build-BigTruckDetector-unknown-Release/BigTruckDetector
		echo "process has been restarted!"
	else
		echo "process already started!"
	fi
		sleep 10
;;
*)
	ps -ef | grep BigTruckDetector | grep -v "grep"
	if [ "$?" -eq 1 ]
	then
		/home/yian/yian_Fence_1110/build-BigTruckDetector-unknown-Release/BigTruckDetector
	else
		echo "process already started!"
	fi
		sleep 10
	ps -ef | grep http_FenceControl | grep -v "grep"
	if [ "$?" -eq 1 ]
	then
		gnome-terminal -- /home/yian/monitorRestartFenceControl.sh
	else
		echo "process already started!"
	fi
		sleep 10
;;
esac
done
