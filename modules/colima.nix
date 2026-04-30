{ config, ... }:

{
  home.sessionVariables.DOCKER_HOST = "unix:/${config.home.homeDirectory}/.colima/default/docker.sock";
}
