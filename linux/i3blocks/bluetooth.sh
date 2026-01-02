#!/bin/sh

INFO=$(bluetoothctl info)

if echo "$INFO" | grep -q "Connected: yes"; then
  echo "$INFO"| awk '$1 == "Alias:" {print "BTH", $2}'
  exit
fi

if bluetoothctl show | grep -q "Powered: yes"; then
  echo "BTH IDLE"
  exit
fi

echo "BTH OFF"
