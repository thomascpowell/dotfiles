{ ... }:

{
  home.username = "t";
  home.homeDirectory = "/home/t";
  device.hostname = "arch";

  home.stateVersion = "26.05";

  imports = [
    ../../modules/shell.nix
    ../../modules/commands.nix
    ../../modules/device.nix
    ../../modules/keyboard.nix

    ../../modules/theme.nix
    ../../modules/dev.nix
    ../../modules/gui.nix
    ../../modules/fonts.nix

    ../../modules/wm/i3/home.nix
  ];

  programs.zsh.enable = true;

  device.trackpad_id = 10;
  device.trackpoint_id = 14;
  device.dpi = 144;

  keyboard.brightness_down = "XF86MonBrightnessDown";
  keyboard.brightness_up = "XF86MonBrightnessUp";
}
