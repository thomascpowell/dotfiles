{ ... }:

{
  home.username = "t";
  home.homeDirectory = "/home/t";

  home.stateVersion = "26.05";

  imports = [
    ../../modules/xdg.nix

    ../../modules/shell.nix
    ../../modules/helpers.nix
    ../../modules/device.nix

    ../../modules/theme.nix
    ../../modules/dev.nix
    ../../modules/gui.nix
    ../../modules/fonts.nix

    ../../modules/wm/niri/home.nix
    ../../modules/wm/i3/home.nix

    ../../modules/keyboard.nix
  ];

  device.hostname = "thinkpad";
  device.is_nixos = true;
  device.dpi = 120;
  device.trackpad_id = 10;
  device.trackpoint_id = 14;

  keyboard.brightness_up = "XF86MonBrightnessUp";
  keyboard.brightness_down = "XF86MonBrightnessDown";
  keyboard.vol_up = "XF86AudioRaiseVolume";
  keyboard.vol_down = "XF86AudioLowerVolume";
  keyboard.vol_mute = "XF86AudioMute";
  keyboard.mic_mute = "XF86AudioMicMute";
}
