{ ... }:

{
  home.username = "t";
  home.homeDirectory = "/home/t";

  home.stateVersion = "26.05";

  imports = [
    ../../modules/home-manager/device.nix
    ../../modules/home-manager/shell.nix
    ../../modules/home-manager/helpers.nix
  ];

  device.hostname = "box";
  device.is_nixos = true;
}
