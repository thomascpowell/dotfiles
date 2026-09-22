{
  flake.homeModules.ghostty =
    {
      lib,
      config,
      pkgs,
      ...
    }:
    {
      home.packages = lib.optionals config.device.is_nixos [ pkgs.ghostty ];
      xdg.configFile."ghostty" = {
        source = ./config;
        recursive = true;
      };
    };
}
