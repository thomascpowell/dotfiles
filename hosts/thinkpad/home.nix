{ ... }:

{
  home.username = "t";
  home.homeDirectory = "/home/t";
  device.hostname = "thinkpad";

  imports = [
    ../common.nix
    ../../modules/theme.nix
    ../../modules/dev.nix
    ../../modules/gui.nix
    ../../modules/fonts.nix

    # ../../modules/i3.nix
    ../../modules/niri/home.nix
  ];

  device.dpi = 96;
  device.is_nixos = true;
  device.trackpad_id = 10;
  device.trackpoint_id = 14;

  keyboard.brightness_down = "XF86MonBrightnessDown";
  keyboard.brightness_up = "XF86MonBrightnessUp";
}
