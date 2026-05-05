{ config, ... }:

{
  home.username = "t";
  home.homeDirectory = "/Users/t";
  device.hostname = "m2";

  imports = [
    ../common.nix
  ];

  home.sessionVariables.DOCKER_HOST = "unix:/${config.device.homeDirectory}/.colima/default/docker.sock";

  home.file.".config/ghostty".source = ../../config/ghostty;
  home.file.".config/aerospace".source = ../../config/aerospace;
}
