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
      xdg.configFile."imv" = {
        source = ./config;
        recursive = true;
      };
    };
}
