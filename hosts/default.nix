{
  config,
  inputs,
  lib,
  ...
}:

let
  inherit (inputs) home-manager nixos-hardware nixpkgs;
  hosts = config.hostModules;

  unfreePackages = [
    "claude-code"
  ];

  allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) unfreePackages;

  mkPkgs =
    system:
    import nixpkgs {
      inherit system;
      config.allowUnfreePredicate = allowUnfreePredicate;
    };

  unfreeNixosModule = {
    nixpkgs.config.allowUnfreePredicate = allowUnfreePredicate;
  };

  homeManagerNixosModule = {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
  };

  mkNixos =
    name: extraModules:
    nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        unfreeNixosModule
        hosts.${name}.system
        home-manager.nixosModules.home-manager
        homeManagerNixosModule
        {
          home-manager.users.t = hosts.${name}.home;
        }
      ]
      ++ extraModules;
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
    flake.nixosConfigurations.box = mkNixos "box" [ ];

    flake.nixosConfigurations.thinkpad = mkNixos "thinkpad" [
      nixos-hardware.nixosModules.lenovo-thinkpad-x1-13th-gen
    ];

    flake.homeConfigurations.m2 = home-manager.lib.homeManagerConfiguration {
      pkgs = mkPkgs "aarch64-darwin";
      modules = [ hosts.m2.home ];
    };

    flake.homeConfigurations.thinkpad = home-manager.lib.homeManagerConfiguration {
      pkgs = mkPkgs "x86_64-linux";
      modules = [ hosts.thinkpad.home ];
    };
  };
}
