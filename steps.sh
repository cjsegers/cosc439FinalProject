#!/usr/bin/env bash
mkdir ScriptOutput
cp /etc/default/keyboard ScriptOutput/keyboard.before
ls /dev/input > ScriptOutput/input.before
cp /proc/bus/input/devices ScriptOutput/devices.before
ls /dev/input/by-id > ScriptOutput/by-id.before

tail -f /var/log/kern.log > ScriptOutput/kernlog.during &
dmesg | grep -E "memory|dma|usb|tty" > ScriptOutput/dmesg.during &

read -n1 -r -p  "You may now type on and switch between keyboards as desired. Press space when finished:"

cp /etc/default/keyboard ScriptOutput/keyboard.after
ls /dev/input > ScriptOutput/input.after
cp /proc/bus/input/devices ScriptOutput/devices.after
ls /dev/input/by-id > ScriptOutput/by-id.after
echo “”
