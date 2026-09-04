{ ... }:

{
  home.username = "t";
  home.homeDirectory = "/home/t";

  home.stateVersion = "26.05";

  imports = [
    ../../modules/home-manager/device.nix
    ../../modules/home-manager/cli.nix
    ../../modules/home-manager/languages.nix
    ../../modules/home-manager/helpers.nix
  ];

  device.hostname = "box";
  device.is_nixos = true;
}
