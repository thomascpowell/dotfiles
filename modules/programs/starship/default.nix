{
  flake.homeModules.starship =
    {
      lib,
      config,
      pkgs,
      ...
    }:

    {
      home.packages = lib.optionals config.device.is_nixos [ pkgs.starship ];
      home.file.".config/starship.toml".source = ./config/starship.toml;
    };
}
