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
      xdg.configFile."starship.toml".source = ./config/starship.toml;
    };
}
