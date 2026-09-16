{ config, ... }:

let
  inherit (config.flake) homeModules nixosModules;
in

{
  hostModules.box.home = {
    imports = [
      homeModules.device
      homeModules.helpers
      homeModules.languages
      homeModules.cli
    ];

    home.username = "t";
    home.homeDirectory = "/home/t";
    home.stateVersion = "26.05";

    device.hostname = "box";
    device.is_nixos = true;
  };

  hostModules.box.system =
    { pkgs, ... }:
    {
      imports = [
        ./hardware-configuration.nix
        nixosModules.docker
      ];

      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      networking.hostName = "box";
      networking.networkmanager.enable = true;
      networking.firewall.enable = true;

      time.timeZone = "America/New_York";

      services.tailscale.enable = true;

      services.openssh = {
        enable = true;
        openFirewall = false;
        settings = {
          KbdInteractiveAuthentication = false;
          PasswordAuthentication = false;
          PermitRootLogin = "no";
        };
      };

      users.users.t = {
        isNormalUser = true;
        description = "t";
        extraGroups = [ "wheel" ];
        shell = pkgs.zsh;
      };

      programs.zsh.enable = true;

      environment.systemPackages = with pkgs; [
        bash
        curl
        git
        vim
      ];

      system.stateVersion = "26.05";
    };
}
