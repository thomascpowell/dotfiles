{ ... }:

{
  home.username = "t";
  home.homeDirectory = "/home/t";

  home.stateVersion = "26.05";

  imports = [
    ../../modules/home_manager/device.nix
    ../../modules/home_manager/shell.nix
    ../../modules/home_manager/helpers.nix
  ];

  device.hostname = "box";
  device.is_nixos = true;
}
