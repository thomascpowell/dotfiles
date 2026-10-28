{ config, ... }:

let
  inherit (config.flake) homeModules;
  inherit (config.flake) nixosModules;
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
        # general
        homeModules.fonts
        homeModules.theme
        homeModules.xdg
        homeModules.disk_utils
        # applications
        homeModules.ghostty
        homeModules.imv
        homeModules.librewolf
        homeModules.mpv
        homeModules.zathura
        homeModules.vesktop
        homeModules.mako
        # wm
        homeModules.niri
      ];
    };

  flake.nixosModules.desktop = { ... }: {
    imports = [
      # general
      nixosModules.printing
      nixosModules.disk_utils
      # wm
      nixosModules.niri
    ];
  };
}
