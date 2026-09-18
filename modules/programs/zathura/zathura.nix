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
      home.file.".config/zathura".source = ./config;
    };
}
