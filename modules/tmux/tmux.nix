{
  flake.homeModules.tmux =
    {
      lib,
      config,
      pkgs,
      ...
    }:

    {
      home.packages = lib.optionals config.device.is_nixos [ pkgs.tmux ];
      xdg.configFile."tmux" = {
        source = ./config;
        recursive = true;
      };
    };
}
