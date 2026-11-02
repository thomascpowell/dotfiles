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
        position = "bottom";
        height = 26;
        spacing = 14;
        modules-left = [
          "niri/workspaces"
        ];
        modules-center = [ ];
        modules-right = [
          "battery"
          "pulseaudio"
          "backlight"
          "bluetooth"
          "network"
          "clock"
        ];

        "niri/workspaces" = {
          format = "WS {index}";
          current-only = true;
        };

        battery = {
          format = "{capacity}";
          format-charging = "{capacity}+";
          format-plugged = "{capacity}+";
          states = {
            warning = 20;
            critical = 10;
          };
        };

        network = {
          format-wifi = "WIFI";
          format-ethernet = "ETH";
          format-linked = "";
          format-disconnected = "";
          format-disabled = "";
          tooltip-format = "{essid} {ifname} {ipaddr}";
          on-click = term (lib.getExe pkgs.wifitui);
        };

        bluetooth = {
          format = "";
          format-off = "";
          format-disabled = "";
          format-connected = "BTH";
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

        "clock" = {
          format = "{:%I:%M}";
          tooltip = true;
          tooltip-format = "{:%m/%d}";
        };
      };

      style = builtins.readFile ./config/style.css;
    };
  };
}
