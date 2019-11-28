#!/bin/bash
clear

if [ $(synclient -l | grep -c 'TouchpadOff.*=.*0') == "1" ];
then
	synclient TouchpadOff=1
else
	synclient TouchpadOff=0
fi
