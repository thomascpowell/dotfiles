{ pkgs, config, lib, services, ... }:

{
  home.file.".config/i3/config".source = ../config/i3/config;
  home.file.".config/i3blocks".source = ../config/i3blocks;
  home.file.".config/picom".source = ../config/picom;
  home.file.".Xresources".source = ../config/.Xresources;
  home.file.".config/rofi".source = ../config/rofi;

  home.file.".config/i3/inputs.conf".text =
    if config.devices.trackpad != null && config.devices.trackpoint != null then ''
      exec_always --no-startup-id xinput --set-prop ${toString config.devices.trackpad} "libinput Accel Speed" 0.7
      exec_always --no-startup-id xinput --set-prop ${toString config.devices.trackpoint} "libinput Accel Speed" -0.5
    '' else "";
}
