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
      xdg.configFile."nvim" = {
	source = ./config;
	recursive = true;
      };
    };
}
