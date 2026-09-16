{
  flake.homeModules.zsh =
    {
      lib,
      config,
      pkgs,
      ...
    }:

    {
      home.packages = lib.optionals config.device.is_nixos [ pkgs.zsh ];
      home.file.".zshrc".source = ./config/.zshrc;
    };
}
