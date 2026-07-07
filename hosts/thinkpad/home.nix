{ ... }:

{
  home.username = "t";
  home.homeDirectory = "/home/t";

  home.stateVersion = "26.05";

  imports = [
    ../../modules/shell.nix
    ../../modules/helpers.nix
    ../../modules/device.nix

    ../../modules/theme.nix
    ../../modules/dev.nix
    ../../modules/gui.nix
    ../../modules/fonts.nix

    ../../modules/wm/niri/home.nix

    ../../modules/keyboard.nix
  ];

  device.hostname = "thinkpad";
  device.is_nixos = true;
  device.dpi = 120;
  device.trackpad_id = 10;
  device.trackpoint_id = 14;
}
