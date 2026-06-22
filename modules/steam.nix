{ lib, ... }:

{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-unwrapped"
    ];

  nixpkgs.overlays = [
    (final: prev: {
      steam = prev.steam.override {
        extraArgs = "-system-composer";
      };
    })
  ];

  programs.steam.enable = true;
}
