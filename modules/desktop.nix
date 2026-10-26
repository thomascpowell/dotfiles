{ config, ... }:

let
  inherit (config.flake) homeModules;
in

{
  flake.homeModules.desktop =
    { pkgs, ... }:
    {

      home.packages = with pkgs; [
        keepassxc
        nautilus
      ];

      imports = [
        homeModules.fonts
        homeModules.theme
        homeModules.xdg
        homeModules.ghostty
        homeModules.imv
        homeModules.librewolf
        homeModules.mpv
        homeModules.zathura
      ];
    };
}
