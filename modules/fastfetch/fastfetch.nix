{
  flake.homeModules.fastfetch =
    {
      lib,
      config,
      pkgs,
      ...
    }:
    {
      home.packages = lib.optionals config.device.is_nixos [ pkgs.fastfetch ];
      xdg.configFile."fastfetch" = {
        source = ./config;
        recursive = true;
      };
    };
}
