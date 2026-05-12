{ ... }:

{
  home.username = "t";
  home.homeDirectory = "/home/t";
  device.hostname = "thinkpad";

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
  ];

  device.is_nixos = true;
}
