{ ... }:

{
  home.username = "t";
  home.homeDirectory = "/home/t";
  device.hostname = "nixos";

  imports = [
    ../common.nix
    ../../modules/theme.nix
    ../../modules/i3.nix
    ../../modules/dev.nix
  ];

  home.file.".config/kitty".source = ../../config/kitty;

  device.dpi = 144;
  device.is_nixos = true;
  device.trackpad_id = 10;
  device.trackpoint_id = 14;
}
