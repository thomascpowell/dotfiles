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
      home.file.".config/ghostty".source = ./config;
    };
}
