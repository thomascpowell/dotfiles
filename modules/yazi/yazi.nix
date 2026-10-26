{
  flake.homeModules.yazi =
    {
      lib,
      config,
      pkgs,
      ...
    }:

    {
      home.packages = lib.optionals config.device.is_nixos [ pkgs.yazi ];
      xdg.configFile."yazi" = {
        source = ./config;
        recursive = true;
      };
    };
}
