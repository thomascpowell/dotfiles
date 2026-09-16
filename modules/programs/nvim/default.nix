{
  flake.homeModules.nvim =
    {
      lib,
      config,
      pkgs,
      ...
    }:

    {
      home.packages = lib.optionals config.device.is_nixos [ pkgs.neovim ];
      home.file.".config/nvim".source = ./config;
    };
}
