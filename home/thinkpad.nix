{ pkgs, ... }:

{
  home.username = "t";
  home.homeDirectory = "/home/t";

  imports = [
    ./common.nix
    ../modules/theme.nix
    ../modules/devices.nix
    ../modules/i3.nix
    ../modules/dev.nix
  ];

  home.file.".config/kitty".source = ../config/kitty;

  devices.trackpad = 10;
  devices.trackpoint = 14;
}
