{
  flake.homeModules.aerospace =
    { ... }:
    {
      home.file.".config/aerospace".source = ./config;
    };
}
