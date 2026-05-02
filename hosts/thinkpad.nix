{ ... }:

{
  home.username = "t";
  home.homeDirectory = "/home/t";
  devices.hostname = "thinkpad";

  imports = [
    ./common.nix
    ../modules/theme.nix
    ../modules/i3.nix
    ../modules/dev.nix
  ];

  home.file.".config/kitty".source = ../config/kitty;

  devices.trackpad = 10;
  devices.trackpoint = 14;
}
