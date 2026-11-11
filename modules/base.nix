{ config, ... }:

let
  inherit (config.flake) homeModules nixosModules;
in

{
  flake.nixosModules.base =
    { pkgs, ... }:
    {
      imports = [
        nixosModules.nix
        nixosModules.user
      ];

      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      networking.networkmanager.enable = true;
      networking.firewall.enable = true;

      time.timeZone = "America/New_York";

      services.tailscale.enable = true;

      environment.systemPackages = with pkgs; [
        bash
        curl
        git
        vim
      ];

      system.stateVersion = "26.05";
    };

  flake.homeModules.base =
    { pkgs, ... }:
    {
      imports = [
        homeModules.device
        homeModules.helpers
        homeModules.languages
        homeModules.cli
      ];

      home.username = "t";
      home.homeDirectory = if pkgs.stdenv.hostPlatform.isDarwin then "/Users/t" else "/home/t";
      home.stateVersion = "26.05";
    };
}
