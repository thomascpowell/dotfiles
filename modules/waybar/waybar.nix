let
  term = cmd: "ghostty -e ${cmd}";
in
{
  flake.homeModules.waybar = { pkgs, lib, ... }: {

    home.packages = with pkgs; [
      bluetui
      wifitui
      pulsemixer
    ];

    programs.waybar = {
      enable = true;
      systemd.enable = true;

      settings.mainBar = {
        layer = "top";
        position = "top";
        height = 26;
        spacing = 14;
        modules-left = [
          "niri/workspaces"
        ];
        modules-center = [ ];
        modules-right = [
          "battery"
          "network"
          "bluetooth"
          "pulseaudio"
          "backlight"
          "clock"
        ];

        "niri/workspaces" = {
          format = "{index}";
          current-only = true;
        };

        battery = {
          format = "BAT {capacity}";
          format-charging = "BAT {capacity}+";
          states = {
            warning = 20;
            critical = 10;
          };
        };

        network = {
          format-wifi = "WIFI CON";
          format-ethernet = "ETH";
          format-linked = "WIFI ON";
          format-disconnected = "WIFI ON";
          format-disabled = "WIFI OFF";
          tooltip-format = "{essid} {ifname} {ipaddr}";
          on-click = term (lib.getExe pkgs.wifitui);
        };

        bluetooth = {
          format = "BTH ON";
          format-off = "BTH OFF";
          format-disabled = "BTH OFF";
          format-connected = "BTH CON";
          tooltip-format-connected = "{device_alias}";
          on-click = term (lib.getExe pkgs.bluetui);
        };

        pulseaudio = {
          format = "VOL {volume}";
          format-muted = "VOL MUTE";
          on-click = term (lib.getExe pkgs.pulsemixer);
          on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          scroll-step = 5;
        };

        backlight = {
          format = "DIS {percent}";
          scroll-step = 5;
        };

        clock = {
          format = "{:%m/%d %I:%M %p}";
          tooltip-format = "<tt>{calendar}</tt>";
        };
      };

      style = builtins.readFile ./config/style.css;
    };
  };
}
