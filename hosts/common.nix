{ ... }:

{
  imports = [
    ../modules/shell.nix
    ../modules/commands.nix
    ../modules/device.nix
  ];

  home.stateVersion = "26.05";

  home.sessionPath = [
    "$HOME/.nix-profile/bin"
  ];

  programs.home-manager.enable = true;
}
