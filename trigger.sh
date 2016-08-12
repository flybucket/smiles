#!/bin/bash
#​
SYSFS_PATH=/sys/kernel/config/device-tree/overlays/pwm
#​
if [[ ! -d $SYSFS_PATH ]]; then
	echo -n "loading dt overlay..."
	mkdir /sys/kernel/config/device-tree/overlays/pwm
	cat /lib/firmware/nextthingco/chip/sample-pwm.dtbo >$SYSFS_PATH/dtbo
	echo "OK"
else
	echo "dt overlay already loaded"
fi
#​
if [[ ! -d /sys/class/pwm/pwmchip0/pwm0 ]]; then
        echo -n "exporting pwm pin... "
        echo 0 >/sys/class/pwm/pwmchip0/export
        echo "OK"
else
	echo "pwm pin already exported"
fi
#​
echo 0 >/sys/class/pwm/pwmchip0/pwm0/enable
echo normal   >/sys/class/pwm/pwmchip0/pwm0/polarity
echo 1 >/sys/class/pwm/pwmchip0/pwm0/enable
#​
#while true; do
echo 20000000 >/sys/class/pwm/pwmchip0/pwm0/period
echo  1350000 >/sys/class/pwm/pwmchip0/pwm0/duty_cycle
sleep 0.1
echo 20000000 >/sys/class/pwm/pwmchip0/pwm0/period
echo  1100000 >/sys/class/pwm/pwmchip0/pwm0/duty_cycle
sleep 0.2
echo 20000000 >/sys/class/pwm/pwmchip0/pwm0/period
echo  1350000 >/sys/class/pwm/pwmchip0/pwm0/duty_cycle
#done
