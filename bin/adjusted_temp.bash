#!/bin/bash
#an adjustment script to move temperatures into a 0-100 range for convenience
#This basically expands the range 15-89c to 0-100

TEMPERATURE=$(~/bin/temp.bash)
TEMPERATURE=$[$TEMPERATURE-15]
TEMPERATURE=$[$TEMPERATURE*100]
TEMPERATURE=$[$TEMPERATURE/74]
echo $TEMPERATURE
