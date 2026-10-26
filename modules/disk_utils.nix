{
  flake.homeModules.disk_utils = { pkgs, ... }: {
    services.udiskie = {
      enable = true;
      tray = "never";
    };
    home.packages = with pkgs; [
      sshfs
      fuse3
    ];
  };

  flake.nixosModules.disk_utils = {
    services.udisks2.enable = true;
  };
}
