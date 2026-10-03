{
  flake.homeModules.sshfs = { pkgs, ... }: {
    home.packages = with pkgs; [
      sshfs
      fuse3
    ];
  };
}
