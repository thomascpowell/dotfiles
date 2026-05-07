{ ... }:

{
  home.username = "t";
  home.homeDirectory = "/home/t";
  device.hostname = "desktop";

  imports = [
    ../common.nix
    ../../modules/theme.nix
    ../../modules/i3.nix
    ../../modules/dev.nix
    ../../modules/gui.nix
    ../../modules/fonts.nix
  ];

  device.dpi = 120;
  device.is_nixos = true;
}
