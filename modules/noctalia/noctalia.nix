{
  flake.homeModules.noctalia =
    {
      lib,
      config,
      pkgs,
      ...
    }:

    {
      home.packages = lib.optionals config.device.is_nixos [ pkgs.noctalia-shell ];
      xdg.configFile."noctalia" = {
        source = ./config;
        recursive = true;
      };
    };
}
