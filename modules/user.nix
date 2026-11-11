{
  flake.nixosModules.user =
    { pkgs, ... }:
    {
      users.users.t = {
        isNormalUser = true;
        description = "t";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        shell = pkgs.zsh;
      };

      programs.zsh.enable = true;
    };
}
