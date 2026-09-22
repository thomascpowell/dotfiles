{
  flake.homeModules.aerospace =
    { ... }:
    {
      xdg.configFile."aerospace" = {
        source = ./config;
        recursive = true;
      };
    };
}
