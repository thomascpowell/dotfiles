{ config, ... }:

let
  inherit (config.flake) homeModules;
in

{
  hostModules.m2.home =
    { config, ... }:
    {
      imports = [
        homeModules.base
        homeModules.aerospace
      ];

      device.hostname = "m2";

      programs.home-manager.enable = true;
      home.sessionVariables.DOCKER_HOST = "unix:/${config.home.homeDirectory}/.colima/default/docker.sock";
    };
}
