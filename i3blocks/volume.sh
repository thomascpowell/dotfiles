#!/bin/sh

out=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null) || exit 0
muted=$(printf '%s\n' "$out" | grep -q MUTED && echo 1 || echo 0)
vol=$(printf '%s\n' "$out" | sed -n 's/.*Volume: 1\.00.*/100/p; s/.*Volume: 0\.\([0-9][0-9]\).*/\1/p')

if [ "$muted" -eq 1 ]; then
    echo "VOL MUTED"
else
    echo "VOL $vol%"
fi
