{ config, ... }:

let
  inherit (config.flake) homeModules nixosModules;
in

{
  hostModules.box.home = {
    imports = [
      homeModules.base
    ];

    device.hostname = "box";
    device.is_nixos = true;
  };

  hostModules.box.system = {
    imports = [
      ./hardware-configuration.nix
      nixosModules.base
      nixosModules.docker
    ];

    networking.hostName = "box";

    services.openssh = {
      enable = true;
      openFirewall = false;
      settings = {
        KbdInteractiveAuthentication = false;
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
  };
}
