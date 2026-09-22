{
  flake.homeModules.mpv =
    {
      lib,
      config,
      pkgs,
      ...
    }:

    {
      home.packages = lib.optionals config.device.is_nixos [ pkgs.mpv-unwrapped ];
      xdg.configFile."mpv" = {
        source = ./config;
        recursive = true;
      };
    };
}
