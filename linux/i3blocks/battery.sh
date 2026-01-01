#!/bin/sh

BAT_DIR=/sys/class/power_supply
bat=$(ls "$BAT_DIR" | grep '^BAT' | head -n1)

cap=$(cat "$BAT_DIR/$bat/capacity")

if grep -q "Charging" "$BAT_DIR/$bat/status"; then
    status="CHR"
else
    status="BAT"
fi

echo "$status $cap%"
