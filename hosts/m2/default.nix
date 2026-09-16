{ config, ... }:

let
  inherit (config.flake) homeModules;
in

{
  hostModules.m2.home =
    { config, ... }:
    {
      imports = [
        homeModules.device
        homeModules.helpers
        homeModules.languages
        homeModules.cli
        homeModules.aerospace
      ];

      home.username = "t";
      home.homeDirectory = "/Users/t";
      home.stateVersion = "26.05";

      device.hostname = "m2";

      programs.home-manager.enable = true;
      home.sessionVariables.DOCKER_HOST = "unix:/${config.home.homeDirectory}/.colima/default/docker.sock";
    };
}
