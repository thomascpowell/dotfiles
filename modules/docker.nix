{ lib, ... }:

{
  virtualisation.docker.enable = true;

  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  users.users.t.extraGroups = lib.mkAfter [ "docker" ];
}
