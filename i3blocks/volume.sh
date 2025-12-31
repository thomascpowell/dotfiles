#!/bin/sh

out=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null) || exit 0

if printf '%s\n' "$out" | grep -q MUTED; then
  echo "VOL MUTED"
else
  vol=$(printf '%s\n' "$out" | sed -n 's/.*Volume: 1\.00.*/100/p; s/.*Volume: 0\.\([0-9][0-9]\).*/\1/p')
  echo "VOL $vol%"
fi
