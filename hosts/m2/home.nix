{ config, ... }:

{
  home.username = "t";
  home.homeDirectory = "/Users/t";
  device.hostname = "m2";

  home.stateVersion = "26.05";

  imports = [
    ../../modules/home_manager
  ];

  programs.home-manager.enable = true;

  home.sessionVariables.DOCKER_HOST = "unix:/${config.home.homeDirectory}/.colima/default/docker.sock";

  home.file.".config/ghostty".source = ../../config/ghostty;
  home.file.".config/aerospace".source = ../../config/aerospace;
}
