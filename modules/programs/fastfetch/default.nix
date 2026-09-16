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
      home.file.".config/fastfetch".source = ./config;
    };
}
