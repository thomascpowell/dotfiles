{
  config,
  pkgs,
  lib,
  ...
}:

# WM: i3
# Supports generic Linux distributions

{
  home.packages = lib.optionals config.device.is_nixos (
    with pkgs;
    [
      i3blocks
      picom
      feh
      playerctl
      brightnessctl
      flameshot
      i3lock
      xdotool
      xinput
      xset
      xclip
      alsa-utils
    ]
  );

  imports = [
    ./rofi.nix
  ];

  home.file.".config/i3/config".source = ../config/i3/config;
  home.file.".config/i3blocks".source = ../config/i3blocks;
  home.file.".config/picom".source = ../config/picom;
  home.file.".config/i3/wallpaper.jpg".source = ../misc/wall/mountain.jpg;

  home.file.".config/i3/inputs.conf".text =
    if config.device.trackpad_id != null && config.device.trackpoint_id != null then
      ''
        exec_always --no-startup-id xinput --set-prop ${toString config.device.trackpad_id} "libinput Accel Speed" 0.7
        exec_always --no-startup-id xinput --set-prop ${toString config.device.trackpoint_id} "libinput Accel Speed" -0.4
      ''
    else
      "";

  home.file.".config/i3/keys.conf".text =
    let
      keys = config.keyboard;
      lines =
        lib.optional (
          keys.vol_mute != null
        ) "bindsym ${config.keyboard.vol_mute} exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ++ lib.optional (
          keys.vol_down != null
        ) "bindsym ${config.keyboard.vol_down} exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-"
        ++ lib.optional (
          keys.vol_down != null
        ) "bindsym ${config.keyboard.vol_up} exec exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+"
        ++ lib.optional (
          keys.mic_mute != null
        ) "bindsym ${config.keyboard.mic_mute} exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ++ lib.optional (
          keys.brightness_down != null
        ) "bindsym ${config.keyboard.brightness_down} exec brightnessctl set 2%-"
        ++ lib.optional (
          keys.brightness_up != null
        ) "bindsym ${config.keyboard.brightness_up} exec brightnessctl set +2%"
        ++ lib.optional (keys.screenshot != null) "bindsym Print exec flameshot gui";
    in
    lib.concatStringsSep "\n" lines + "\n";

  home.file.".Xresources".text =
    if config.device.dpi != null then "Xft.dpi: ${toString config.device.dpi}" else "";
}
