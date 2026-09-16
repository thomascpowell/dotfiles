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
      home.file.".config/yazi".source = ./config;
    };
}
