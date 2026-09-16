{ config, ... }:

let
  inherit (config.flake) homeModules;
in

{
  flake.homeModules.desktop =
    { ... }:
    {
      imports = [
        homeModules.fonts
        homeModules.theme
        homeModules.xdg
        homeModules.ghostty
        homeModules.imv
        homeModules.keepassxc
        homeModules.librewolf
        homeModules.mpv
        homeModules.zathura
      ];
    };
}
