{
  flake.homeModules.zathura =
    {
      lib,
      config,
      pkgs,
      ...
    }:

    {
      home.packages = lib.optionals config.device.is_nixos [ pkgs.zathura ];
      xdg.configFile."zathura" = {
        source = ./config;
        recursive = true;
      };
    };
}
