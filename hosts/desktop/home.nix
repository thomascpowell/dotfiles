{ ... }:

{
  home.username = "t";
  home.homeDirectory = "/home/t";
  device.hostname = "desktop";

  home.stateVersion = "26.05";

  imports = [
    ../../modules/shell.nix
    ../../modules/helpers.nix
    ../../modules/device.nix
    ../../modules/keyboard.nix

    ../../modules/theme.nix
    ../../modules/dev.nix
    ../../modules/gui.nix
    ../../modules/fonts.nix

    ../../modules/wm/i3/home.nix
  ];

  device.dpi = 120;
  device.is_nixos = true;
}
