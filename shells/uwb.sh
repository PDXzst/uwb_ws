#! /bin/bash  
# this declares that current user is a sudoer
sudo tee /etc/sudoers.d/$USER <<END
END

if ls -l /dev/ttyCH343USB0 ; then
	sudo chmod 777 /dev/ttyCH343USB0;
else
	echo "sudo chmod /dev/ttyCH343USB0 fail";
	exit 1
fi

sleep 1s
# 显示坐标
gnome-terminal --tab --title="ros_1" -- bash -c "roslaunch nlink_parser linktrack.launch;"

sleep 1s
# 启动定位模块
gnome-terminal --tab --title="ros_2" -- bash -c "roslaunch pozyx_simulation uwb_exper.launch;"


sleep 1s
# 显示坐标
gnome-terminal --tab --title="ros_3" -- bash -c "rostopic echo /uav_position;"


