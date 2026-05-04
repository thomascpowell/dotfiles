{ ... }:

{
  home.username = "t";
  home.homeDirectory = "/home/t";
  device.hostname = "thinkpad";

  imports = [
    ../common.nix
    ../../modules/theme.nix
    ../../modules/i3.nix
    ../../modules/dev.nix
  ];

  home.file.".config/kitty".source = ../../config/kitty;

  device.trackpad_id = 10;
  device.trackpoint_id = 14;
  device.dpi = 144;
}
