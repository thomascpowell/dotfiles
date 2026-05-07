{ ... }:

{
  imports = [
    ../modules/shell.nix
    ../modules/commands.nix
    ../modules/device.nix
  ];

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  home.sessionPath = [
    "$HOME/.nix-profile/bin"
  ];
}
