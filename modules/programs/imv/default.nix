{
  flake.homeModules.imv =
    {
      lib,
      config,
      pkgs,
      ...
    }:
    {
      home.packages = lib.optionals config.device.is_nixos [ pkgs.imv ];
      home.file.".config/imv".source = ./config;
    };
}
