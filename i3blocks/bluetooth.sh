#!/bin/sh

if bluetoothctl info | grep -q "Connected: yes"; then
  echo "BTH ON"
  exit
fi

if bluetoothctl show | grep -q "Powered: yes"; then
  echo "BTH IDLE"
  exit
fi

echo "BTH OFF"
