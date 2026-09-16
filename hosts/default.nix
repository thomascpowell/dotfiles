{
  config,
  inputs,
  lib,
  ...
}:

let
  inherit (inputs) home-manager nixos-hardware nixpkgs;
  hosts = config.hostModules;

  homeManagerNixosModule = {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
  };
in

{
  imports = [
    ./box
    ./m2
    ./thinkpad
  ];

  options.hostModules = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.raw;
    default = { };
  };

  config = {
    flake.nixosConfigurations.box = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        hosts.box.system
        home-manager.nixosModules.home-manager
        homeManagerNixosModule
        {
          home-manager.users.t = hosts.box.home;
        }
      ];
    };

    flake.nixosConfigurations.thinkpad = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        hosts.thinkpad.system
        nixos-hardware.nixosModules.lenovo-thinkpad-x1-13th-gen
        home-manager.nixosModules.home-manager
        homeManagerNixosModule
        {
          home-manager.users.t = hosts.thinkpad.home;
        }
      ];
    };

    flake.homeConfigurations.m2 = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."aarch64-darwin";
      modules = [ hosts.m2.home ];
    };

    flake.homeConfigurations.thinkpad = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
      modules = [ hosts.thinkpad.home ];
    };
  };
}
