#!/bin/sh
while true
do
case "$(curl -s --max-time 2 -I https://github.com | sed 's/^[^ ]*  *\([0-9]\).*/\1/; 1q')" in
[23])
        ps -ef | grep http_FenceControl | grep -v "grep"
        if [ "$?" -eq 1 ]
	then	
        	cd /home/yian/FenceControl_0304/build-http_FenceControl-unknown-Release
        	wget https://github.com/a5372935/updateExecutable/blob/main/http_FenceControl?raw=true -O http_FenceControl
        	chmod 777 http_FenceControl
        	echo "update successful!"
		wait
        	/home/yian/FenceControl_0304/build-http_FenceControl-unknown-Release/http_FenceControl
        	echo "process has been restarted!"
	else
        	echo "process already started!"
	fi
		sleep 10
;;
*)
        ps -ef | grep http_FenceControl | grep -v "grep"
        if [ "$?" -eq 1 ]
        then
                /home/yian/FenceControl_0304/build-http_FenceControl-unknown-Release/http_FenceControl
        else
                echo "process already started!"
        fi
                sleep 10
;;
esac
done


