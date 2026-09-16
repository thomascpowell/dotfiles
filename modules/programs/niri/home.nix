{ config, ... }:

let
  inherit (config.flake) homeModules;
in
{
  flake.homeModules.niri =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      home.packages = lib.optionals config.device.is_nixos (
        with pkgs;
        [
          xwayland-satellite
          libnotify
          wl-clipboard
          brightnessctl
          playerctl

          (writeShellScriptBin "cb" "wl-copy")
        ]
      );

      imports = [
        homeModules.grim
        homeModules.noctalia
        homeModules.rofi
      ];

      xdg.configFile."niri".source = ./config;
      services.polkit-gnome.enable = true;
      programs.swaylock.enable = true;
    };
}
