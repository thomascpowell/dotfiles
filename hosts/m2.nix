{ ... }:

{
  home.username = "t";
  home.homeDirectory = "/Users/t";
  devices.hostname = "m2";

  imports = [
    ./common.nix
    ../modules/colima.nix
  ];

  home.file.".config/ghostty".source = ../config/ghostty;
  home.file.".config/aerospace".source = ../config/aerospace;
}
