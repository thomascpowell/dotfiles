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
      home.file.".config/mpv".source = ./config;
    };
}
