{
  config,
  pkgs,
  lib,
  ...
}:

# Window manager

{
  home.packages = lib.optionals config.device.is_nixos (
    with pkgs;
    [
      i3blocks
      picom
      rofi
      feh
      playerctl
      brightnessctl
      flameshot
      i3lock
      xdotool
      xinput
      xset
      alsa-utils
    ]
  );

  home.file.".config/i3/config".source = ../config/i3/config;
  home.file.".config/i3blocks".source = ../config/i3blocks;
  home.file.".config/picom".source = ../config/picom;
  home.file.".config/rofi".source = ../config/rofi;
  home.file.".config/i3/wallpaper.jpg".source = ../misc/wall/mountain.jpg;

  home.file.".config/i3/inputs.conf".text =
    if config.device.trackpad_id != null && config.device.trackpoint_id != null then
      ''
        exec_always --no-startup-id xinput --set-prop ${toString config.device.trackpad_id} "libinput Accel Speed" 0.7
        exec_always --no-startup-id xinput --set-prop ${toString config.device.trackpoint_id} "libinput Accel Speed" -0.4
      ''
    else
      "";

  home.file.".Xresources".text =
    if config.device.dpi != null then "Xft.dpi: ${toString config.device.dpi}" else "";
}
