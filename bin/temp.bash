#!/bin/bash
# A quick and dirty script to determine the maximum temperate reported by any of the 7 CPU temperature gagues.
# All the temps can be found at /sys/class/hwmon/hwmon0/device/temp{1,2,3,4,5,6,7}_input

MAX=0
N_MAX=0

MAX=$( cat /sys/class/hwmon/hwmon0/device/temp1_input | cut -c 1-2 )
N_MAX=$( cat /sys/class/hwmon/hwmon0/device/temp2_input | cut -c 1-2 )

if [ $N_MAX -gt $MAX ]
then
    MAX=$N_MAX
fi
N_MAX=$( cat /sys/class/hwmon/hwmon0/device/temp3_input | cut -c 1-2 )
if [ $N_MAX -gt $MAX ]
then
    MAX=$N_MAX
fi
N_MAX=$( cat /sys/class/hwmon/hwmon0/device/temp4_input | cut -c 1-2 )
if [ $N_MAX -gt $MAX ]
then
    MAX=$N_MAX
fi
N_MAX=$( cat /sys/class/hwmon/hwmon0/device/temp5_input | cut -c 1-2 )
if [ $N_MAX -gt $MAX ]
then
    MAX=$N_MAX
fi
N_MAX=$( cat /sys/class/hwmon/hwmon0/device/temp6_input | cut -c 1-2 )
if [ $N_MAX -gt $MAX ]
then
    MAX=$N_MAX
fi
N_MAX=$( cat /sys/class/hwmon/hwmon0/device/temp7_input | cut -c 1-2 )
if [ $N_MAX -gt $MAX ]
then
    MAX=$N_MAX
fi

echo $MAX
exit 0
