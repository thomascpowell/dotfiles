{ ... }:

# WM: i3
# Scripts bluetoothctl, xrandr, nmcli, etc

{

  home.file.".local/bin/emoji".text = ''
    #!/bin/sh

    tail -n +3 ~/dotfiles/misc/data/emoji_list | rofi -case-smart -sorting-method fzf -dmenu | awk '{print $1}' | tr -d '\n' | xclip -selection clipboard
  '';

  home.file.".local/bin/accent".text = ''
    #!/bin/sh

    printf '%s' "$(sed -n '/^__DATA__$/,$p' "$0" | tail -n +2)" | awk -F';' '{print $1 " " $2}' | rofi -case-smart -sorting-method fzf -dmenu | awk '{print $1}' | tr -d '\n' | xclip -selection clipboard
    exit;

    __DATA__
    á; a
    é; e
    í; i
    ó; o
    ú; u
    ñ; n
  '';

  home.file.".local/bin/connect_bluetooth".text = ''
    #!/bin/sh
    DEVICE=$1
    MAC=$(bluetoothctl devices | awk -v dev="$DEVICE" '$3 == dev {print $2}')
    bluetoothctl connect "$MAC" | grep -q "successful" && echo "OK" || echo "ERROR"
  '';

  home.file.".local/bin/connect_monitor".text = ''
    #!/bin/sh
    DATA=xrandr

    PRIMARY=$("$DATA" | awk '$3=="primary" && $2=="connected" {print $1}')
    OUTPUT=$("$DATA" | awk -v primary="$PRIMARY" '$2=="connected" && $1!=primary {print $1}' | fzf)

    DIRECTION=$(printf "above\nbelow\nleft-of\nright-of" | fzf)
    MODES=$($DATA | awk -v out="$OUTPUT" '$1 == out {found=1; next} found && /^[[:space:]]+[0-9]/ {print $1} found && !/^[[:space:]]+/ {exit}')
    MODE=$(printf "%s\n" "$MODES" | fzf)

    if [ -z "$MODE" ] || [ -z "$OUTPUT" ] || [ -z "$DIRECTION" ]; then
      echo "ERROR"
      exit 1
    fi

    xrandr --output "$OUTPUT" --mode "$MODE" --"$DIRECTION" "$PRIMARY"
    echo "OK ($OUTPUT $DIRECTION $PRIMARY)"
  '';

  home.file.".local/bin/connect_wifi".text = ''
    #!/bin/sh
    nmcli device wifi connect "$1" --ask
  '';
}
